import 'package:flutter/material.dart';

import '../extensions/build_context_extension.dart';
import 'decorated_tappable.dart';

class PageEdgeContainer extends StatelessWidget {
  const PageEdgeContainer._({
    super.key,
    required this.child,
    this.onTap,
    this.transparentBehindEdges = true,
    this.backgroundOpaque = false,
    _PageEdgeContainerAnchor anchor = _PageEdgeContainerAnchor.bottom,
  }) : _anchor = anchor;

  final VoidCallback? onTap;
  final Widget child;
  final bool transparentBehindEdges;
  final bool backgroundOpaque;
  final _PageEdgeContainerAnchor _anchor;

  factory PageEdgeContainer.top({
    Key? key,
    VoidCallback? onTap,
    required Widget child,
    bool transparentBehindEdges = true,
    bool backgroundOpaque = false,
  }) =>
      PageEdgeContainer._(
        key: key,
        onTap: onTap,
        transparentBehindEdges: transparentBehindEdges,
        backgroundOpaque: backgroundOpaque,
        anchor: _PageEdgeContainerAnchor.top,
        child: child,
      );

  factory PageEdgeContainer.bottom({
    Key? key,
    VoidCallback? onTap,
    required Widget child,
    bool transparentBehindEdges = true,
    bool backgroundOpaque = false,
  }) =>
      PageEdgeContainer._(
        key: key,
        onTap: onTap,
        transparentBehindEdges: transparentBehindEdges,
        backgroundOpaque: backgroundOpaque,
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    var backgroundColor = const Color(0xFFFFFFFF);
    if (!backgroundOpaque) {
      backgroundColor = backgroundColor.withOpacity(0.9);
    }
    return ColoredBox(
      color: transparentBehindEdges
          ? Colors.transparent
          : Theme.of(context).scaffoldBackgroundColor,
      child: DecoratedTappable(
        onTap: onTap,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: const Color(0xFFE5F4F3)),
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(171, 206, 203, 0.3),
              offset: _anchor.offset,
              blurRadius: 30,
            ),
          ],
          borderRadius: _anchor.borderRadius,
        ),
        padding: _anchor.padding(context),
        child: child,
      ),
    );
  }
}

enum _PageEdgeContainerAnchor { top, bottom }

extension on _PageEdgeContainerAnchor {
  BorderRadiusGeometry? get borderRadius {
    return switch (this) {
      _PageEdgeContainerAnchor.top => const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      _PageEdgeContainerAnchor.bottom => const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )
    };
  }

  Offset get offset {
    return switch (this) {
      _PageEdgeContainerAnchor.top => const Offset(2, 3),
      _PageEdgeContainerAnchor.bottom => const Offset(2, 3)
    };
  }

  EdgeInsetsGeometry padding(BuildContext context) {
    return switch (this) {
      _PageEdgeContainerAnchor.top => EdgeInsets.only(
          top: context.topSafeArea > 0 ? context.topSafeArea : 8,
          bottom: 16,
          right: 64,
        ),
      _PageEdgeContainerAnchor.bottom => EdgeInsets.only(
          top: 16,
          bottom: context.bottomSafeArea > 0 ? context.bottomSafeArea : 8,
        )
    };
  }
}
