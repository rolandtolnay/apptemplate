import 'package:flutter/material.dart';

import '../extensions/build_context_extension.dart';
import 'page_edge_container.dart';

/// Used inside `pageAction` property of `NmdScaffold`
class PageActionContainer extends StatelessWidget {
  const PageActionContainer({
    super.key,
    required this.actionWidget,
    required this.descriptionLabel,
  });

  final String descriptionLabel;
  final Widget actionWidget;

  static double bottomPadding(BuildContext context) =>
      context.bottomSafeArea + 112;

  @override
  Widget build(BuildContext context) {
    return PageEdgeContainer.bottom(
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 8,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Text(
              descriptionLabel,
              style: context.nmdTypography.bodyMedium
                  .copyWith(color: context.nmdColor.lightGrey),
            ),
            const SizedBox(height: 12),
            Align(child: actionWidget),
          ],
        ),
      ),
    );
  }
}
