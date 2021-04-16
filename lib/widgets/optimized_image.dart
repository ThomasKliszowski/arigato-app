import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/statically.dart';

class OptimizedImage extends StatelessWidget {
  const OptimizedImage({
    Key key,
    @required this.url,
    this.optimizedAxis,
    this.quality = 90,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.placeholder,
    this.imageBuilder,
  }) : super(key: key);

  final String url;
  final Axis optimizedAxis;
  final int quality;
  final BoxFit fit;
  final Alignment alignment;
  final PlaceholderWidgetBuilder placeholder;
  final ImageWidgetBuilder imageBuilder;

  @override
  Widget build(BuildContext context) {
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    return LayoutBuilder(builder: (context, constraints) {
      return CachedNetworkImage(
        fit: fit,
        alignment: alignment,
        placeholder: placeholder,
        imageBuilder: imageBuilder,
        imageUrl: Statically.buildUrl(
          url,
          height: optimizedAxis == Axis.vertical
              ? (constraints.maxHeight * devicePixelRatio).toInt()
              : null,
          width: optimizedAxis == Axis.horizontal
              ? (constraints.maxWidth * devicePixelRatio).toInt()
              : null,
          q: quality,
        ),
      );
    });
  }
}
