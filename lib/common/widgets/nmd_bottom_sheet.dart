import 'package:flutter/material.dart';

import '../extensions/build_context_extension.dart';

class NmdBottomSheet extends StatelessWidget {
  const NmdBottomSheet({
    super.key,
    required this.actions,
    this.description,
    this.title,
    this.titleIcon,
  });

  final String? title;

  /// Suggested size 24 x 24
  final Widget? titleIcon;
  final String? description;
  final Widget actions;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: ColoredBox(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Visibility(
                visible: title != null,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: titleIcon != null,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: titleIcon,
                        ),
                      ),
                      Text(
                        title ?? '',
                        style: context.nmdTypography.titleLarge,
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: description != null,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 32),
                  child: Text(
                    description ?? '',
                    style: context.nmdTypography.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Align(child: actions),
              SizedBox(height: context.bottomSafeArea > 0 ? 16 : 0),
            ],
          ),
        ),
      ),
    );
  }
}
