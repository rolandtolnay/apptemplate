import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/subjects.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../common/domain/api_exception.dart';
import '../../common/push_notification/push_notification_repository.dart';
import '../../nmd_environment.dart';
import '../../root/domain/injectable.dart';
import '../model/user_entity.dart';

abstract class AuthRepository {
  Stream<AuthState> get onAuthStateChanged;

  Future<UserEntity?> get currentUser;

  Stream<UserEntity?> get onUserChanged;

  Future<UserEntity?> signInAnonymously();

  Future<UserEntity?> signInWithApple({bool shouldLink = false});

  Future<UserEntity?> signInWithGoogle({bool shouldLink = false});

  Future<void> signOut();
}

enum AuthState { anonymous, authenticated, signedOut, loading }

Logger _log = Logger('$AuthRepository');

@LazySingleton(as: AuthRepository)
class FirAuthRepository implements AuthRepository {
  final _auth = FirebaseAuth.instance;

  final _userController = StreamController<UserEntity?>.broadcast();
  StreamSubscription<UserEntityDocumentSnapshot>? _userListener;

  final _authStateController = BehaviorSubject<AuthState>();

  FirAuthRepository() {
    _auth.authStateChanges().listen((firUser) async {
      if (firUser == null) {
        _authStateController.add(AuthState.signedOut);
        _userController.add(null);
        await _userListener?.cancel();
        _log.info('User was signed out.');
        return;
      }

      _authStateController.add(
        firUser.isAnonymous ? AuthState.anonymous : AuthState.authenticated,
      );

      final user = await currentUser;
      if (user != null) {
        await _listenOnCollectionChanges(user.id);
      } else {
        _log.warning('No user found in database for ${firUser.uid}');
        await _makeDatabaseUser(firUser);
      }
    });
  }

  @override
  Stream<AuthState> get onAuthStateChanged => _authStateController.stream;

  @override
  Future<UserEntity?> get currentUser async {
    final firUser = _auth.currentUser;
    if (firUser == null) return Future.value();
    final snap = await usersRef.doc(firUser.uid).get();
    return snap.data;
  }

  @override
  Stream<UserEntity?> get onUserChanged => _userController.stream;

  @override
  Future<UserEntity?> signInAnonymously() async {
    _log.info('Signing user in anonymously...');

    try {
      await _auth.signInAnonymously();

      final firUser = _auth.currentUser;
      if (firUser == null) throw ApiException('Unexpected null user.');

      var user = await currentUser;
      return user ??= await _makeDatabaseUser(firUser);
    } catch (e, st) {
      _log.severe('Failed to sign in anonymously:', e, st);
      throw ApiException('$e');
    }
  }

  @override
  Future<UserEntity?> signInWithApple({bool shouldLink = false}) async {
    _log.info('Attempting to sign in with Apple...');

    try {
      final rawNonce = generateNonce();
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.fullName,
          AppleIDAuthorizationScopes.email,
        ],
        nonce: rawNonce.sha256String,
      );

      final providerId = AppleAuthProvider.PROVIDER_ID;
      final firCredential = OAuthProvider(providerId).credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );
      return _signInWithAuthCredential(
        firCredential,
        shouldLink: shouldLink,
        displayName: appleCredential.displayName,
      );
    } on SignInWithAppleAuthorizationException catch (e, st) {
      if (e.code == AuthorizationErrorCode.canceled) {
        _log.fine('Apple sign in was canceled.', e, st);
        return null;
      }
      _log.severe('Failed to sign in with Apple: $e', e, st);
      throw ApiException('$e');
    } catch (e, st) {
      _log.severe('Failed to sign in with Apple: $e', e, st);
      throw ApiException('$e');
    }
  }

  @override
  Future<UserEntity?> signInWithGoogle({bool shouldLink = false}) async {
    _log.info('Attempting to sign in with Google...');

    try {
      final googleUser = await GoogleSignIn(
        clientId: NmdEnvironment.firebaseOptions.iosClientId,
        scopes: ['email', 'profile'],
      ).signIn();

      final googleAuth = await googleUser?.authentication;

      final accessToken = googleAuth?.accessToken;
      final idToken = googleAuth?.idToken;
      if (accessToken == null && idToken == null) {
        _log.fine('Google sign in was canceled.');
        return null;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );
      return _signInWithAuthCredential(
        credential,
        shouldLink: shouldLink,
        displayName: googleUser?.displayName,
      );
    } catch (e, st) {
      _log.severe('Failed to sign in with Google: $e', e, st);
      throw ApiException('$e');
    }
  }

  Future<UserEntity?> _signInWithAuthCredential(
    OAuthCredential credential, {
    required bool shouldLink,
    String? displayName,
  }) async {
    final existingPushPerm = (await currentUser)?.pushPermission;

    final providerId = credential.providerId;
    try {
      if (shouldLink) {
        await _auth.currentUser?.linkWithCredential(credential);
        _log.info('Successfully linked user with $providerId.');
      } else {
        await _auth.signInWithCredential(credential);
        _log.info('Successfully signed in with $providerId.');
      }

      final firUser = _auth.currentUser;
      if (firUser == null) throw ApiException('Unexpected null user.');

      final user = await currentUser;
      if (user == null) {
        return _makeDatabaseUser(
          firUser,
          isOnboarded: true,
          displayName: displayName,
          pushPermission: existingPushPerm,
        );
      }

      if (user.linkedProviders.contains(providerId)) return user;

      final updated = user.linkWithProvider(
        providerId: providerId,
        email: firUser.email,
        displayName: displayName ?? firUser.displayName,
        photoUrl: firUser.photoURL,
      );
      await usersRef.doc(firUser.uid).set(updated);
      if (displayName != firUser.displayName) {
        await firUser.updateDisplayName(displayName);
      }

      _log.info('Successfully updated user with $providerId credentials.');
      return updated;
    } catch (e, st) {
      _log.severe('Failed to sign in with $providerId: $e', e, st);
      throw ApiException('$e');
    }
  }

  @override
  Future<void> signOut() async {
    await getIt.reset();
    await configureDependencies();
    await _auth.signOut();
  }

  Future<UserEntity> _makeDatabaseUser(
    User firUser, {
    bool isOnboarded = false,
    String? displayName,
    PushNotificationPermission? pushPermission,
  }) async {
    final id = firUser.uid;
    final user = UserEntity(
      id: id,
      email: firUser.email,
      displayName: displayName ?? firUser.displayName,
      photoUrl: firUser.photoURL,
      linkedProviders: firUser.providerData.map((p) => p.providerId).toSet(),
      isOnboarded: isOnboarded,
      pushPermission: pushPermission ?? PushNotificationPermission.notAsked,
    );

    await usersRef.doc(id).set(user);
    await _listenOnCollectionChanges(id);
    _log.info('Successfully made new database user for $id');

    return user;
  }

  Future<void> _listenOnCollectionChanges(String userId) async {
    await _userListener?.cancel();
    _userListener = usersRef.doc(userId).snapshots().listen((snap) {
      _userController.add(snap.data);
    });
    _log.info('Subscribed to user collection changes.\nUser id: $userId');
  }
}

extension on AuthorizationCredentialAppleID {
  String get displayName => '${givenName ?? ''} ${familyName ?? ''}'.trim();
}

extension on String {
  /// Returns the sha256 hash in hex notation.
  String get sha256String {
    final bytes = utf8.encode(this);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
