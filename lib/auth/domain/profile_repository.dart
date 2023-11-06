import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

import '../../auth/model/user_entity.dart';
import '../../common/domain/api_exception.dart';
import '../../common/push_notification/push_notification_repository.dart';
import 'auth_repository.dart';

abstract class ProfileRepository {
  Future<void> setLanguage(
    Language language, {
    required UserEntity user,
  });

  Future<UserEntity> completeOnboarding({
    required UserEntity user,
  });

  Future<void> setPushPermission(
    PushNotificationPermission permission, {
    required UserEntity user,
  });

  Future<UserEntity?> updateDisplayName(String name);
}

Logger _log = Logger('$ProfileRepository');

@LazySingleton(as: ProfileRepository)
class FirProfileRepository implements ProfileRepository {
  final _firAuth = FirebaseAuth.instance;
  final AuthRepository _authRepository;

  FirProfileRepository(this._authRepository);

  @override
  Future<void> setLanguage(
    Language language, {
    required UserEntity user,
  }) async {
    final updated = user.copyWith(language: language);
    await usersRef.doc(user.id).set(updated);
  }

  @override
  Future<UserEntity> completeOnboarding({
    required UserEntity user,
  }) async {
    final updated = user.copyWith(isOnboarded: true);
    await usersRef.doc(user.id).set(updated);
    return updated;
  }

  @override
  Future<void> setPushPermission(
    PushNotificationPermission permission, {
    required UserEntity user,
  }) async {
    final updated = user.copyWith(pushPermission: permission);
    await usersRef.doc(user.id).set(updated);
  }

  @override
  Future<UserEntity?> updateDisplayName(String name) async {
    assert(
      _firAuth.currentUser != null,
      'Current user cannot be null when updating name',
    );
    try {
      await _firAuth.currentUser?.updateDisplayName(name);

      final user = await _authRepository.currentUser;
      if (user != null) await usersRef.doc(user.id).update(displayName: name);

      return user;
    } catch (e, st) {
      _log.severe('Failed to update display name:', e, st);
      throw ApiException('$e');
    }
  }
}
