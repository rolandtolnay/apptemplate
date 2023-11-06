import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/analytics/analytics_repository.dart';
import '../../common/push_notification/push_notification_provider.dart';
import '../../common/push_notification/push_notification_repository.dart';
import '../../root/domain/injectable.dart';
import '../domain/auth_repository.dart';
import '../domain/profile_repository.dart';
import '../model/user_entity.dart';
import 'language_provider.dart';

final userProvider = StateNotifierProvider<UserNotifier, UserEntity?>(
  (ref) => UserNotifier(getIt(), ref, getIt(), getIt()),
);

class UserNotifier extends StateNotifier<UserEntity?> {
  final AuthRepository _authRepository;
  final ProfileRepository _profileRepository;
  final AnalyticsRepository _analytics;
  final Ref _ref;

  StreamSubscription<UserEntity?>? _listener;

  UserNotifier(
    this._authRepository,
    this._ref,
    this._analytics,
    this._profileRepository,
  ) : super(null) {
    _listener = _authRepository.onUserChanged.listen((user) {
      if (state == null) {
        user != null ? _authUser(user) : _authRepository.signInAnonymously();
      }
      state = user;
    });
  }

  Future<void> updateDisplayName(String name) async {
    await _profileRepository.updateDisplayName(name);
  }

  void _authUser(UserEntity user) {
    _analytics.identify(user.id);
    _ref.read(languageProvider.notifier).setLanguage(user.language);

    if (user.pushPermission != PushNotificationPermission.notAsked) {
      // Syncs backend in case user changed permission in settings
      _ref.read(pushNotificationProvider).requestPermissions(
            provisional: user.shouldAskForProvisionalPush,
          );
    }
  }

  @override
  void dispose() {
    _listener?.cancel();
    super.dispose();
  }
}

extension PushProvision on UserEntity {
  bool get shouldAskForProvisionalPush =>
      pushPermission == PushNotificationPermission.provisional;
}
