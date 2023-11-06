import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/domain/profile_repository.dart';
import '../../auth/provider/user_provider.dart';
import '../../root/domain/injectable.dart';
import '../extensions/build_context_extension.dart';
import 'push_notification_permission_sheet.dart';
import 'push_notification_repository.dart';

final pushNotificationProvider =
    ChangeNotifierProvider<PushNotificationNotifier>((ref) {
  return PushNotificationNotifier(getIt(), getIt(), getIt(), ref);
});

Logger _log = Logger('$PushNotificationNotifier');

const _storageKey = 'app_push_permission';

class PushNotificationNotifier extends ChangeNotifier {
  final PushNotificationRepository _pushRepository;
  final ProfileRepository _profileRepository;
  final SharedPreferences _prefs;
  final Ref _ref;

  PushNotificationNotifier(
    this._pushRepository,
    this._profileRepository,
    this._prefs,
    this._ref,
  );

  Future<void> requestPermissions({required bool provisional}) async {
    final permission = await _pushRepository.requestPermissions(
      provisional: provisional,
    );
    _log.info('Did receive push notification permission: ${permission.name}');

    if (!didAskOnThisDevice) {
      await _pushRepository.subscribeToTopic(PushNotificationTopic.appUpdates);
      await savePermissionAsk(permission);
    }

    final user = _ref.read(userProvider);
    if (user != null && user.pushPermission != permission) {
      await _profileRepository.setPushPermission(permission, user: user);
    }
  }

  bool get didAskOnThisDevice => _prefs.getString(_storageKey) != null;

  Future<void> savePermissionAsk(PushNotificationPermission permission) =>
      _prefs.setString(_storageKey, permission.name);
}

extension PushNotificationCheck on WidgetRef {
  void checkForPushPermissions({bool ignoreIfAnonymous = false}) {
    final user = read(userProvider);
    if (user == null) return;
    if (user.pushPermission == PushNotificationPermission.notAsked) {
      if (ignoreIfAnonymous && user.isAnonymous) return;

      final notifier = read(pushNotificationProvider);
      if (notifier.didAskOnThisDevice) {
        // won't show native dialog, but will update backend
        notifier.requestPermissions(
          provisional: user.shouldAskForProvisionalPush,
        );
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!context.isTopMostRoute) return;
          PushNotificationPermissionSheet.show(context);
        });
      }
    }
  }
}
