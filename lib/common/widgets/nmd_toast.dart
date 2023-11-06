import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../extensions/build_context_extension.dart';

class NmdToast extends StatelessWidget {
  const NmdToast._({
    required this.title,
    this.trailing,
    this.backgroundColor,
    this.textColor,
  });

  final String title;
  final Widget? trailing;
  final Color? backgroundColor;
  final Color? textColor;

  static void show(
    BuildContext context, {
    required String title,
    Widget? trailing,
    Duration duration = const Duration(seconds: 3),
  }) {
    FToast()
      ..init(context)
      ..showToast(
        child: NmdToast._(title: title, trailing: trailing),
        gravity: ToastGravity.BOTTOM,
        fadeDuration: const Duration(milliseconds: 250),
        toastDuration: duration,
      );
  }

  static void showError(BuildContext context, Exception exception) {
    FToast()
      ..init(context)
      ..showToast(
        child: NmdToast._(
          title: exception.toString().replaceAll('Exception: ', ''),
          backgroundColor: context.colorScheme.error,
          textColor: context.colorScheme.onError,
        ),
        gravity: ToastGravity.BOTTOM,
        fadeDuration: const Duration(milliseconds: 250),
        toastDuration: const Duration(seconds: 3),
      );
  }

  @override
  Widget build(BuildContext context) {
    final snackBarTheme = Theme.of(context).snackBarTheme;
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? snackBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: context.nmdTypography.label.copyWith(
                color: textColor ?? context.colorScheme.onPrimary,
                height: 1.3,
              ),
            ),
          ),
          Visibility(
            visible: trailing != null,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: trailing,
            ),
          ),
        ],
      ),
    );
  }
}
