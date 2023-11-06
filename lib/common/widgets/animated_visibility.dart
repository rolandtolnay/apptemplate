import 'package:flutter/widgets.dart';

import '../constants.dart';

class AnimatedVisibility extends StatelessWidget {
  const AnimatedVisibility({
    super.key,
    required this.child,
    this.replacement = const SizedBox.shrink(),
    this.visible = true,
    this.duration = NmdAnimation.durationNormal,
  });

  final Widget child;
  final Widget replacement;
  final bool visible;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      child: visible ? child : replacement,
    );
  }
}
