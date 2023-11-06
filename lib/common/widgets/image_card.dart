import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../extensions/build_context_extension.dart';
import 'nmd_cached_network_image.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.imageUrl,
    this.description,
    this.borderRadius = 14,
    this.descriptionPadding =
        const EdgeInsets.only(bottom: 16, left: 16, right: 16),
    this.descriptionMaxLines = 3,
  });

  final String imageUrl;
  final double borderRadius;
  final String? description;
  final EdgeInsets descriptionPadding;
  final int descriptionMaxLines;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Visibility(
            visible: imageUrl.isNotEmpty,
            replacement: Container(
              decoration: BoxDecoration(
                gradient: context.nmdColor.primaryGradientDisabled,
              ),
            ),
            child: NmdCachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              errorWidget: (_, __, ___) => Container(
                decoration: BoxDecoration(
                  gradient: context.nmdColor.primaryGradientDisabled,
                ),
              ),
            ),
          ),
          Visibility(
            visible: description != null && imageUrl.isNotEmpty,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                  stops: const [0.5, 1.0],
                ),
              ),
            ),
          ),
          Visibility(
            visible: description != null,
            child: Positioned(
              bottom: descriptionPadding.bottom,
              left: descriptionPadding.left,
              right: descriptionPadding.right,
              child: AutoSizeText(
                description ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  height: 1.5,
                  color: Colors.white,
                ),
                maxLines: descriptionMaxLines,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
