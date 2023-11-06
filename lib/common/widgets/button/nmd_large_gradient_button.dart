import 'package:flutter/material.dart';

import '../../extensions/build_context_extension.dart';
import '../decorated_tappable.dart';
import '../nmd_loading_indicator.dart';

class NmdLargeGradientButton extends StatelessWidget {
  const NmdLargeGradientButton({
    super.key,
    required this.title,
    this.enabled = true,
    this.loading = false,
    this.icon,
    this.onPressed,
  });

  final String title;
  final Widget? icon;
  final VoidCallback? onPressed;
  final bool enabled;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final loadingIndicator = Visibility(
      visible: loading,
      child: NmdLoadingIndicator(color: context.colorScheme.onPrimary),
    );

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: icon != null,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: icon ?? const SizedBox.shrink(),
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: context.nmdTypography.buttonLarge,
            maxLines: 1,
            softWrap: false,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: context.nmdSize.primaryButtonMinWidth,
        minHeight: 54,
        maxHeight: 54,
      ),
      child: DecoratedTappable(
        onTap: enabled && !loading ? onPressed : null,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(185, 210, 208, 0.18),
              offset: Offset(2, 3),
              blurRadius: 24,
            ),
          ],
          gradient: enabled && !loading
              ? context.nmdColor.primaryGradient
              : context.nmdColor.primaryGradientDisabled,
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
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
