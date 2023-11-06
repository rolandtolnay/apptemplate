import 'package:flutter/material.dart';

import '../../extensions/build_context_extension.dart';

class NmdUnderlineButton extends StatelessWidget {
  const NmdUnderlineButton({
    super.key,
    required this.title,
    this.onPressed,
    this.enabled = true,
    this.color,
  });

  final String title;
  final VoidCallback? onPressed;
  final bool enabled;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final color = enabled
        ? this.color ?? context.nmdColor.primaryGreen
        : context.nmdColor.primaryDisabled;
    return InkWell(
      onTap: enabled ? onPressed : null,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Text(
          title,
          style: context.nmdTypography.buttonSmall.copyWith(
            fontWeight: FontWeight.w600,
            color: color,
            decoration: TextDecoration.underline,
            decorationColor: color,
          ),
        ),
      ),
    );
  }
}
