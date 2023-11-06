import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../gen/assets.gen.dart';
import '../../translations/locale_keys.g.dart';
import '../extensions/build_context_extension.dart';
import '../use_init_hook.dart';
import '../widgets/button/nmd_large_gradient_button.dart';
import '../widgets/button/nmd_underline_button.dart';
import '../widgets/common_dialog.dart';
import 'app_update_provider.dart';

class AppUpdateDialog extends HookConsumerWidget {
  const AppUpdateDialog({super.key, required this.data});

  final AppUpdateData data;

  static Future<void> show(
    BuildContext context, {
    required AppUpdateData data,
  }) {
    return showCupertinoModalPopup(
      context: context,
      barrierDismissible: !data.isRequired,
      builder: (_) => AppUpdateDialog(data: data),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useInitAsync(() {
      ref.read(appUpdateProvider).didShowDialog();
    });

    return CommonDialog(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.icons.lampCharge.svg(
                  height: 24,
                  width: 24,
                  colorFilter: context.nmdColor.primaryYellow.filter,
                ),
                const SizedBox(width: 10),
                Text(
                  tr(LocaleKeys.common_update_available),
                  style: context.nmdTypography.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 26),
            Text(
              tr(LocaleKeys.common_ready_to_level_up),
              style: context.nmdTypography.bodyMedium,
            ),
            const SizedBox(height: 16),
            Text(
              tr(LocaleKeys.common_our_latest_update),
              style: context.nmdTypography.bodyMedium,
            ),
            const SizedBox(height: 26),
            Align(
              child: NmdLargeGradientButton(
                title: tr(LocaleKeys.common_update),
                onPressed: () {
                  final url = data.installUrl;
                  if (url != null) {
                    launchUrlString(url, mode: LaunchMode.externalApplication);
                  }
                  if (!data.isRequired) Navigator.of(context).pop();
                },
              ),
            ),
            Visibility(
              visible: !data.isRequired,
              child: Align(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: NmdUnderlineButton(
                    title: tr(LocaleKeys.common_later),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
