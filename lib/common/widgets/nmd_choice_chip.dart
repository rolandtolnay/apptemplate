import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../extensions/build_context_extension.dart';
import '../haptic_provider.dart';
import 'decorated_tappable.dart';

class NmdChoiceChip extends ConsumerWidget {
  const NmdChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    this.width,
    this.icon,
    this.onSelected,
  });

  final double? width;
  final String label;
  final Widget? icon;

  final bool selected;
  final ValueChanged<bool>? onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hPadding = context.nmdSize.choiceChipHorizontalPadding;
    return DecoratedTappable(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: selected
              ? context.nmdColor.primaryGreen
              : const Color(0xFFE5ECF0),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(185, 210, 208, 0.18),
            blurRadius: 24,
            offset: Offset(2, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: hPadding),
      onTap: () {
        ref.read(hapticProvider).feedback(HapticType.selection);
        onSelected?.call(!selected);
      },
      child: Row(
        mainAxisAlignment:
            icon != null ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          Visibility(
            visible: icon != null,
            child: Padding(
              padding: EdgeInsets.only(right: hPadding),
              child: icon ?? const SizedBox.shrink(),
            ),
          ),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                style: context.nmdTypography.label.copyWith(
                  color: selected
                      ? context.nmdColor.primaryGreen
                      : const Color(0xff454545),
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
                maxLines: 1,
                softWrap: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
