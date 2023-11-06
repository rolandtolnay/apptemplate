import 'package:flutter/material.dart';

import '../nmd_size.dart';

class CommonDialog extends StatelessWidget {
  final Widget? child;
  final double? maxWidth;
  final double? maxHeight;

  const CommonDialog({super.key, this.child, this.maxWidth, this.maxHeight});

  @override
  Widget build(BuildContext context) {
    final maxWidth = this.maxWidth ?? 428;
    final maxHeight = this.maxHeight ?? double.infinity;
    return MaxWidthContainer(
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.hardEdge,
        elevation: 4,
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: child,
      ),
    );
  }
}

class MaxWidthContainer extends StatelessWidget {
  const MaxWidthContainer({
    super.key,
    required this.child,
    this.maxWidth = kTabletWidth,
    this.maxHeight = double.infinity,
  });

  final Widget child;
  final double maxWidth;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
        child: child,
      ),
    );
  }
}
