import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final _menuStyle = MenuStyle(
  shape: MaterialStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: const BorderSide(color: Color(0xffE3ECEB)),
    ),
  ),
  padding: const MaterialStatePropertyAll(
    EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  ),
);

class NmdMenuAnchor extends HookWidget {
  const NmdMenuAnchor({
    super.key,
    required this.menuChildren,
    required this.builder,
    this.controller,
  });

  final List<Widget> menuChildren;
  final MenuAnchorChildBuilder? builder;
  final MenuController? controller;

  @override
  Widget build(BuildContext context) {
    final controller = useState(this.controller ?? MenuController());
    return MenuAnchor(
      controller: controller.value,
      style: _menuStyle,
      menuChildren: menuChildren,
      builder: builder,
    );
  }
}

class NmdSubmenuButton extends StatelessWidget {
  const NmdSubmenuButton({
    super.key,
    required this.menuChildren,
    required this.child,
    this.leadingIcon,
  });

  final List<Widget> menuChildren;
  final Widget child;
  final Widget? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return SubmenuButton(
      menuChildren: menuChildren,
      menuStyle: _menuStyle,
      leadingIcon: leadingIcon,
      child: child,
    );
  }
}
