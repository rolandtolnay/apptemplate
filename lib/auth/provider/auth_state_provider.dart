import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../root/domain/injectable.dart';
import '../domain/auth_repository.dart';

final authStateProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier(getIt());
});

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repository;
  StreamSubscription<AuthState>? _listener;

  AuthStateNotifier(this._repository) : super(AuthState.loading) {
    _listener = _repository.onAuthStateChanged.listen((authState) {
      state = authState;
    });
  }

  @override
  void dispose() {
    _listener?.cancel();
    super.dispose();
  }
}
