import 'package:flutter/material.dart';

import '../../extensions/build_context_extension.dart';
import '../decorated_tappable.dart';
import '../nmd_loading_indicator.dart';

class NmdSmallAccentButton extends StatelessWidget {
  const NmdSmallAccentButton({
    super.key,
    this.title,
    this.enabled = true,
    this.loading = false,
    this.onPressed,
    this.icon,
    this.height = 44,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
  });

  final String? title;
  final bool enabled;
  final bool loading;
  final VoidCallback? onPressed;

  final double height;
  final BorderRadius borderRadius;

  /// Recomended size 20x20, color primaryRed
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final loadingIndicator = Visibility(
      visible: loading,
      child: NmdLoadingIndicator(color: context.nmdColor.primaryYellow),
    );

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: icon != null,
          child: Padding(
            padding: EdgeInsets.only(right: title != null ? 12 : 0),
            child: icon ?? const SizedBox.shrink(),
          ),
        ),
        Expanded(
          child: Text(
            title ?? '',
            style: context.nmdTypography.buttonSmall.copyWith(
              color: context.nmdColor.primaryYellow,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            softWrap: false,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: height,
        maxHeight: height,
      ),
      child: DecoratedTappable(
        onTap: enabled && !loading ? onPressed : null,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(color: context.nmdColor.primaryYellow),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(185, 210, 208, 0.18),
              offset: Offset(2, 3),
              blurRadius: 24,
            ),
          ],
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        padding: EdgeInsets.fromLTRB(
          12,
          12,
          (title != null && icon != null) ? 16 : 12,
          12,
        ),
        child: IntrinsicWidth(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Opacity(opacity: loading ? 0 : 1, child: content),
              loadingIndicator,
            ],
          ),
        ),
      ),
    );
  }
}
