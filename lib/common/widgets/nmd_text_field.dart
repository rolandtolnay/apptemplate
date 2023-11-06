import 'package:flutter/material.dart';

import '../extensions/build_context_extension.dart';

class NmdTextField extends StatelessWidget {
  const NmdTextField({
    super.key,
    required this.controller,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 14,
      vertical: 16,
    ),
    this.onSubmitted,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines = 1,
    this.minLines = 1,
    this.autofocus = true,
    this.onChanged,
    this.onEditingComplete,
    this.onTap,
    this.onTapOutside,
    this.focusNode,
    this.label,
    this.style,
    this.maxLength,
  });

  final String? label;
  final TextEditingController controller;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int maxLines;
  final int minLines;
  final bool autofocus;
  final EdgeInsetsGeometry padding;

  final TextStyle? style;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final FocusNode? focusNode;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              label ?? '',
              style: context.nmdTypography.subtitleLarge.copyWith(
                fontWeight: FontWeight.w500,
                color: const Color(0xff363636),
              ),
            ),
          ),
        ),
        DecoratedBox(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(185, 210, 208, 0.18),
                spreadRadius: 2,
                blurRadius: 24,
                offset: Offset(2, 3), // changes position of shadow
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            autofocus: autofocus,
            focusNode: focusNode,
            decoration: InputDecoration(
              contentPadding: padding,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Color(0xffE3ECEB)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: context.nmdColor.primaryGreen),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Color(0xffE3ECEB)),
              ),
              fillColor: Colors.white,
              filled: true,
              counter: maxLength == null ? const SizedBox.shrink() : null,
              counterStyle:
                  context.nmdTypography.labelSmall.copyWith(fontSize: 11),
              hintText: hintText,
              hintStyle: style?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff838383),
                  ) ??
                  context.nmdTypography.bodyMedium.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff838383),
                  ),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
            ),
            style: style ??
                context.nmdTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w400,
                ),
            onEditingComplete: onEditingComplete,
            onChanged: onChanged,
            onFieldSubmitted: onSubmitted,
            onTap: onTap,
            onTapOutside: onTapOutside,
            maxLines: maxLines,
            minLines: minLines,
            maxLength: maxLength,
          ),
        ),
      ],
    );
  }
}
