import 'package:flutter/material.dart';

class DecoratedTappable extends StatelessWidget {
  const DecoratedTappable({
    super.key,
    this.decoration,
    this.padding,
    this.onTap,
    this.child,
    this.width,
    this.height,
    this.elevation = 0,
  });

  final Widget? child;
  final BoxDecoration? decoration;

  final double elevation;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    BorderRadius? borderRadius;
    if (decoration?.borderRadius is BorderRadius) {
      borderRadius = decoration?.borderRadius as BorderRadius?;
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: decoration?.boxShadow,
      ),
      child: Material(
        borderRadius: decoration?.borderRadius,
        clipBehavior: Clip.hardEdge,
        elevation: elevation,
        surfaceTintColor: Colors.transparent,
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
          child: Ink(
            width: width,
            height: height,
            decoration: decoration,
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
