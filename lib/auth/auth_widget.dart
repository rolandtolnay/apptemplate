import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/widgets/loading_scaffold.dart';
import '../root/domain/injectable.dart';
import '../root/root_page.dart';
import 'auth_login_page.dart';
import 'domain/auth_repository.dart';
import 'provider/auth_state_provider.dart';
import 'provider/user_provider.dart';

class AuthWidget extends HookConsumerWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final user = ref.watch(userProvider);

    final isFirstLaunch = ref.watch(firstLaunchProvider);
    switch (authState) {
      case AuthState.loading:
        return const LoadingScaffold();
      case AuthState.signedOut:
        if (isFirstLaunch) return const OnboardingPage();
        return const AuthLoginPage();
      case AuthState.authenticated:
      case AuthState.anonymous:
        if (user == null) {
          // Fixes flicker between signedOut and anonymous on first launch
          if (isFirstLaunch) return const OnboardingPage();
          return const LoadingScaffold();
        }
        return user.isOnboarded ? const RootPage() : const OnboardingPage();
    }
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(developer): Implement onboarding page
    return const Placeholder();
  }
}

final firstLaunchProvider =
    StateNotifierProvider.autoDispose<FirstLaunchNotifier, bool>(
  (ref) => FirstLaunchNotifier(getIt()),
);

const _isFirstLaunchStorageKey = 'app_is_first_launch';

class FirstLaunchNotifier extends StateNotifier<bool> {
  final SharedPreferences _prefs;

  FirstLaunchNotifier(this._prefs)
      : super(_prefs.getBool(_isFirstLaunchStorageKey) ?? true);

  void didFirstLaunch() {
    _prefs.setBool(_isFirstLaunchStorageKey, false);
    state = false;
  }
}
