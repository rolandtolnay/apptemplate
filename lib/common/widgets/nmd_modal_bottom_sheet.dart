import 'package:flutter/material.dart';

Future<T?> showNmdModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool isDismissible = true,
}) {
  return showModalBottomSheet<T>(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    clipBehavior: Clip.hardEdge,
    isScrollControlled: true,
    context: context,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    isDismissible: isDismissible,
    enableDrag: isDismissible,
    builder: builder,
  );
}
