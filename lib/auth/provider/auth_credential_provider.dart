import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/request_notifier.dart';
import '../../root/domain/injectable.dart';
import '../domain/auth_repository.dart';
import '../model/user_entity.dart';
import 'user_provider.dart';

final authCredentialProvider =
    ChangeNotifierProvider.autoDispose<AuthCredentialNotifier>((ref) {
  return AuthCredentialNotifier(getIt(), ref);
});

class AuthCredentialNotifier extends RequestNotifier<UserEntity?> {
  final AuthRepository _repository;
  final Ref _ref;

  AuthCredentialNotifier(this._repository, this._ref);

  Future<void> signInWithApple() => executeRequest(
        () => _repository.signInWithApple(shouldLink: _shouldLink),
      );

  Future<void> signInWithGoogle() => executeRequest(
        () => _repository.signInWithGoogle(shouldLink: _shouldLink),
      );

  bool get _shouldLink {
    final user = _ref.read(userProvider);
    return user != null && user.isAnonymous;
  }
}
