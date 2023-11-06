import 'package:flutter/material.dart';

import '../../extensions/build_context_extension.dart';
import '../decorated_tappable.dart';

class NmdGradientIconButton extends StatelessWidget {
  const NmdGradientIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.size = 54,
    this.enabled = true,
  });

  /// Recommended size 20x20
  final Widget icon;
  final double size;
  final VoidCallback? onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return DecoratedTappable(
      onTap: onPressed,
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: enabled
            ? context.nmdColor.primaryGradient
            : context.nmdColor.primaryGradientDisabled,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(77, 182, 172, enabled ? 0.34 : 0.1),
            spreadRadius: 2,
            blurRadius: 26,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: Center(child: icon),
    );
  }
}
