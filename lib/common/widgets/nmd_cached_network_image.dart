import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NmdCachedNetworkImage extends StatelessWidget {
  const NmdCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.fadeOutDuration = const Duration(milliseconds: 1000),
    this.fit,
    this.errorWidget,
  });

  final String imageUrl;
  final BoxFit? fit;
  final Duration fadeInDuration;
  final Duration fadeOutDuration;
  final LoadingErrorWidgetBuilder? errorWidget;

  @override
  Widget build(BuildContext context) {
    final url =
        kIsWeb ? 'https://proxy-xa55dnxjmq-uc.a.run.app/$imageUrl' : imageUrl;

    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      fadeInDuration: fadeInDuration,
      fadeOutDuration: fadeOutDuration,
      errorWidget: errorWidget,
    );
  }
}
