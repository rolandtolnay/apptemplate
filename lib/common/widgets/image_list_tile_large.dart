import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../extensions/build_context_extension.dart';
import 'image_card.dart';

class ImageListTileLarge extends StatelessWidget {
  const ImageListTileLarge({
    super.key,
    required this.title,
    required this.imageUrl,
    this.titleMaxLines = 2,
    this.imageTrailing,
    this.subtitleWidget,
    this.description,
    this.descriptionWidget,
    this.onTap,
    this.contentPadding = const EdgeInsets.all(10),
    this.backgroundColor,
  }) : assert(
          description == null || descriptionWidget == null,
          'Cannot provide both description and descriptionWidget',
        );

  final String title;
  final String imageUrl;
  final Widget? imageTrailing;
  final Widget? subtitleWidget;
  final String? description;
  final Widget? descriptionWidget;

  final VoidCallback? onTap;

  final int titleMaxLines;
  final EdgeInsets contentPadding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    const aspect = 2.29;
    final imageWidth = (context.screenWidth - 56) / aspect;
    final containerIndent = imageWidth / 2;

    final cellContent = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xffE5ECF0)),
        color: backgroundColor,
      ),
      padding: EdgeInsets.fromLTRB(
        imageWidth - containerIndent + contentPadding.left,
        contentPadding.top,
        contentPadding.right,
        contentPadding.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            title,
            maxLines: titleMaxLines,
            overflow: TextOverflow.ellipsis,
            style: context.nmdTypography.subtitleLarge.copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xff1f1f1f),
            ),
          ),
          Visibility(
            visible: subtitleWidget != null,
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: subtitleWidget,
            ),
          ),
          Expanded(
            child: descriptionWidget ??
                Center(
                  child: AutoSizeText(
                    description ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: context.nmdTypography.labelSmall,
                  ),
                ),
          ),
        ],
      ),
    );

    final image = SizedBox(
      width: imageWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          children: [
            ImageCard(imageUrl: imageUrl),
            Positioned(
              top: 4,
              right: 4,
              child: imageTrailing ?? const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: containerIndent,
            right: 0,
            child: cellContent,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: image,
          ),
        ],
      ),
    );
  }
}
