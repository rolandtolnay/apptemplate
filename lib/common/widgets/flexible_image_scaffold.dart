import 'package:flutter/material.dart';

import '../extensions/build_context_extension.dart';
import 'button/nmd_floating_icon_button.dart';
import 'nmd_cached_network_image.dart';
import 'nmd_scaffold.dart';

class FlexibleImageScaffold extends StatelessWidget {
  const FlexibleImageScaffold({
    super.key,
    required this.body,
    this.imageUrl,
    this.automaticallyImplyLeading = true,
    this.safeAreaValues = const SafeAreaValues(top: false),
    this.trailing,
    this.flexibleWidget,
  });

  final Widget? flexibleWidget;
  final String? imageUrl;
  final Widget body;
  final bool automaticallyImplyLeading;
  final Widget? trailing;
  final SafeAreaValues safeAreaValues;

  @override
  Widget build(BuildContext context) {
    final imageHeight = (imageUrl ?? '').isNotEmpty || flexibleWidget != null
        ? MediaQuery.of(context).size.height * 0.33
        : 40.0;

    final flexibleImage = SliverAppBar(
      leading: const SizedBox.shrink(),
      expandedHeight: imageHeight,
      collapsedHeight: 0,
      toolbarHeight: 0,
      stretch: true,
      pinned: true,
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: flexibleWidget ??
              Visibility(
                visible: (imageUrl ?? '').isNotEmpty,
                child: NmdCachedNetworkImage(
                  imageUrl: imageUrl ?? '',
                  fit: BoxFit.cover,
                ),
              ),
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        left: safeAreaValues.left,
        top: safeAreaValues.top,
        right: safeAreaValues.right,
        bottom: safeAreaValues.bottom,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CustomScrollView(
              slivers: [
                flexibleImage,
                SliverToBoxAdapter(child: body),
              ],
            ),
            Visibility(
              visible: automaticallyImplyLeading && context.canPop,
              child: Positioned(
                top: MediaQuery.of(context).padding.top + 8,
                left: 20,
                child: const FloatingBackButton(),
              ),
            ),
            Visibility(
              visible: trailing != null,
              child: Positioned(
                top: MediaQuery.of(context).padding.top + 8,
                right: 20,
                child: trailing ?? const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
