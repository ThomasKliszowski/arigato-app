import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../utils/statically.dart';
import '../widgets/page_view.dart';

class ReaderView extends StatelessWidget {
  const ReaderView({
    Key key,
    @required this.itemCount,
    @required this.getPhotoUrl,
    this.pageController,
  }) : super(key: key);

  final String Function(int index) getPhotoUrl;
  final int itemCount;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PhotoViewGestureDetectorScope(
      axis: Axis.horizontal,
      child: CustomPageView.builder(
        cacheExtent: 2,
        controller: pageController ?? PageController(),
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemBuilder: (context, i) => _Page(photoUrl: getPhotoUrl(i)),
        itemCount: itemCount,
      ),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({
    Key key,
    @required this.photoUrl,
  }) : super(key: key);

  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: PhotoView(
        key: ObjectKey(photoUrl),
        backgroundDecoration: const BoxDecoration(color: Colors.black),
        imageProvider:
            CachedNetworkImageProvider(Statically.buildUrl(photoUrl)),
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
}
