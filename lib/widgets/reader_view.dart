import 'package:arigato/widgets/page_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ReaderView extends StatelessWidget {
  const ReaderView({
    Key key,
    @required this.itemCount,
    @required this.getPhotoUrl,
  }) : super(key: key);

  final String Function(int index) getPhotoUrl;
  final int itemCount;

  Widget buildItem(BuildContext context, int index) {
    return ClipRect(
      child: PhotoView(
        key: ObjectKey(index),
        backgroundDecoration: const BoxDecoration(),
        imageProvider: CachedNetworkImageProvider(getPhotoUrl(index)),
        initialScale: PhotoViewComputedScale.contained,
        minScale: PhotoViewComputedScale.contained,
        maxScale: 2.0,
        scaleStateCycle: (state) => state == PhotoViewScaleState.initial
            ? PhotoViewScaleState.originalSize
            : PhotoViewScaleState.initial,
        filterQuality: FilterQuality.low,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PhotoViewGestureDetectorScope(
      axis: Axis.horizontal,
      child: CustomPageView.builder(
        cacheExtent: 3,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemBuilder: buildItem,
        itemCount: itemCount,
      ),
    );
  }
}
