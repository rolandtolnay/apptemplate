import 'package:flutter/material.dart';

/// This widget removes the focus from any TextField widget when tapping on any white space area,
/// hence, making the system keyboard disappear.
class KeyboardFocusDetector extends StatelessWidget {
  const KeyboardFocusDetector({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
