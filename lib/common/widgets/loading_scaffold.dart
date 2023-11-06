import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../analytics/use_analytics_track_screen.dart';
import 'nmd_loading_indicator.dart';
import 'nmd_scaffold.dart';

class LoadingScaffold extends HookConsumerWidget {
  const LoadingScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useAnalyticsTrackScreen('$LoadingScaffold');

    return const NmdScaffold(body: LoadingScaffoldBody());
  }
}

class LoadingScaffoldBody extends StatelessWidget {
  const LoadingScaffoldBody({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        SizedBox(width: 64, child: NmdLoadingIndicator(color: color)),
        const SizedBox(height: 64),
        const Spacer(),
      ],
    );
  }
}
