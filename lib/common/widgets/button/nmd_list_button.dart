import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../extensions/build_context_extension.dart';
import '../decorated_tappable.dart';

class NmdListButton extends StatelessWidget {
  const NmdListButton({
    super.key,
    required this.title,
    this.icon,
    this.onPressed,
    this.textColor,
    this.showAuxArrow = true,
  });

  final String title;

  /// Recommended size 18x18
  final Widget? icon;
  final VoidCallback? onPressed;
  final Color? textColor;
  final bool showAuxArrow;

  @override
  Widget build(BuildContext context) {
    return DecoratedTappable(
      onTap: onPressed,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        border: Border.all(
          color: const Color(0xFFE5ECF0),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(185, 210, 208, 0.18),
            blurRadius: 24,
            offset: Offset(2, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      child: Row(
        children: [
          Visibility(
            visible: icon != null,
            child: Padding(
              padding: const EdgeInsets.only(right: 14),
              child: icon,
            ),
          ),
          Text(
            title,
            style: context.nmdTypography.subtitleLarge.copyWith(
              color: textColor ?? const Color(0xff363636),
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Visibility(
            visible: showAuxArrow,
            child: Assets.icons.arrowRight.svg(height: 20, width: 20),
          ),
        ],
      ),
    );
  }
}
