import 'package:flutter/material.dart';

class RoundedBox extends StatelessWidget {
  const RoundedBox({
    super.key,
    this.onTap,
    required this.child,
    this.padding = const EdgeInsets.all(16),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          border: Border.all(
            color: const Color(0xFFE3ECEB),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(175, 196, 209, 0.21),
              offset: Offset(2, 3),
              blurRadius: 24,
            ),
          ],
          borderRadius: BorderRadius.circular(14),
        ),
        padding: padding,
        child: child,
      ),
    );
  }
}
