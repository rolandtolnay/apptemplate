import 'package:flutter/material.dart';

import '../decorated_tappable.dart';

class NmdSimpleIconButton extends StatelessWidget {
  const NmdSimpleIconButton({super.key, required this.icon, this.onPressed});

  final Widget icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedTappable(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      onTap: onPressed,
      child: icon,
    );
  }
}
