import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/extensions/build_context_extension.dart';
import '../../../common/widgets/nmd_bottom_sheet.dart';
import '../../../common/widgets/nmd_modal_bottom_sheet.dart';
import '../../../gen/assets.gen.dart';
import '../../translations/locale_keys.g.dart';
import '../widgets/button/nmd_large_gradient_button.dart';
import '../widgets/button/nmd_underline_button.dart';
import 'push_notification_provider.dart';

class PushNotificationPermissionSheet extends HookConsumerWidget {
  const PushNotificationPermissionSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showNmdModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (_) => const PushNotificationPermissionSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NmdBottomSheet(
      title: tr(LocaleKeys.common_notifications_sheet_title),
      titleIcon: Assets.icons.notification.svg(
        width: 24,
        height: 24,
        colorFilter: context.nmdColor.primaryYellow.filter,
      ),
      description: tr(LocaleKeys.common_notifications_sheet_description),
      actions: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NmdLargeGradientButton(
            title: tr(LocaleKeys.common_notifications_enable),
            onPressed: () {
              ref
                  .read(pushNotificationProvider)
                  .requestPermissions(provisional: false);
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(height: 16),
          NmdUnderlineButton(
            title: tr(LocaleKeys.common_not_now),
            onPressed: () {
              ref
                  .read(pushNotificationProvider)
                  .requestPermissions(provisional: true);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
