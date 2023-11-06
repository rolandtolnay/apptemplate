import 'dart:ui';

import 'package:flutter/material.dart';

class NmdBlurredButton extends StatelessWidget {
  const NmdBlurredButton({super.key, required this.icon, this.onPressed});

  /// Recommended size 18x18
  final Widget icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 34,
      height: 34,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.hardEdge,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
          child: Material(
            color: Colors.black.withOpacity(0.2),
            child: InkWell(
              onTap: onPressed,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(child: icon),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
