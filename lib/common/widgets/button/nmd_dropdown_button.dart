import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../extensions/build_context_extension.dart';

class NmdDropdownButton<T> extends StatelessWidget {
  const NmdDropdownButton({
    super.key,
    required this.value,
    required this.onChanged,
    required this.items,
    required this.itemBuilder,
  });

  final T? value;
  final ValueChanged<T?> onChanged;
  final List<T> items;
  final DropdownMenuItem<T> Function(T item) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        border: Border.all(color: const Color(0xFFE5ECF0)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB9D2D0).withOpacity(0.18),
            spreadRadius: 2,
            blurRadius: 24,
            offset: const Offset(2, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: DropdownButton<T>(
        borderRadius: BorderRadius.circular(16),
        padding: EdgeInsets.zero,
        isDense: true,
        icon: Assets.icons.arrowDown.svg(height: 24, width: 24),
        value: value,
        isExpanded: true,
        style: context.nmdTypography.subtitleLarge.copyWith(
          color: const Color(0xff545454),
          fontFamily: FontFamily.lato,
        ),
        items: items.map<DropdownMenuItem<T>>(itemBuilder).toList(),
        onChanged: onChanged,
        underline: const SizedBox.shrink(),
      ),
    );
  }
}
