import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../gen/assets.gen.dart';
import '../../haptic_provider.dart';

class NmdFloatingIconButton extends StatelessWidget {
  const NmdFloatingIconButton({
    super.key,
    required this.icon,
    this.backgroundColor,
    this.onPressed,
    this.size = 44,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.borderSide,
    this.loading = false,
    this.elevation = 0,
  });

  /// Recommended size 20x20
  final Widget icon;

  final double size;
  final Color? backgroundColor;
  final BorderSide? borderSide;
  final BorderRadius borderRadius;
  final VoidCallback? onPressed;
  final bool loading;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    const loadingIndicator =
        SizedBox.square(dimension: 20, child: CircularProgressIndicator());
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(185, 210, 208, 0.18),
            offset: Offset(2, 3),
            blurRadius: 24,
          ),
        ],
      ),
      child: Material(
        color: backgroundColor ?? Colors.white,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: borderSide ?? const BorderSide(color: Color(0xFFE3ECEB)),
        ),
        child: InkWell(
          onTap: loading ? null : onPressed,
          borderRadius: borderRadius,
          child: Center(child: loading ? loadingIndicator : icon),
        ),
      ),
    );
  }
}

class FloatingBackButton extends ConsumerWidget {
  const FloatingBackButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NmdFloatingIconButton(
      icon: Assets.icons.arrowLeft.svg(width: 20, height: 20),
      onPressed: onPressed ??
          () {
            ref.read(hapticProvider).feedback(HapticType.light);
            Navigator.of(context).pop();
          },
    );
  }
}

class FloatingCloseButton extends ConsumerWidget {
  const FloatingCloseButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NmdFloatingIconButton(
      icon: Assets.icons.xmark.svg(width: 12, height: 12),
      onPressed: onPressed ??
          () {
            ref.read(hapticProvider).feedback(HapticType.light);
            Navigator.of(context).pop();
          },
    );
  }
}
