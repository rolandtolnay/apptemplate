import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/app_update/app_update_dialog.dart';
import '../common/app_update/app_update_provider.dart';
import '../common/domain/remote_config/remote_config_repository.dart';
import '../common/push_notification/push_notification_provider.dart';
import '../common/use_init_hook.dart';
import 'domain/injectable.dart';

class RootPage extends HookConsumerWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (_) => const RootPage());
  }

  const RootPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useInitAsync(() => _checkForAppUpdates(ref, context));

    useOnAppLifecycleStateChange((_, next) {
      if (next == AppLifecycleState.resumed) {
        getIt<RemoteConfigRepository>().fetchAndActivate();
        _checkForAppUpdates(ref, context);
        ref.checkForPushPermissions(ignoreIfAnonymous: true);
      }
    });

    // TODO(developer): Implement your root page
    return const Scaffold();
  }

  void _checkForAppUpdates(WidgetRef ref, BuildContext context) {
    final notifier = ref.read(appUpdateProvider);
    final data = notifier.appUpdateData;
    if (notifier.shouldShowDialog && data != null && context.mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AppUpdateDialog.show(context, data: data)
            .then((_) => notifier.didDismissDialog());
      });
    }
  }
}
