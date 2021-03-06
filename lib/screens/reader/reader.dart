import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../protos/library.pb.dart' as protos;
import '../../screens/reader/state.dart';
import '../../services/backend.dart';

class Reader extends HookWidget {
  const Reader({
    Key key,
    @PathParam('mangaId') this.mangaId,
    @PathParam('chapterId') this.chapterId,
  }) : super(key: key);

  final String mangaId;
  final String chapterId;

  @override
  Widget build(BuildContext context) {
    final state = use(ReaderStateHook(
      BackendService.of(context),
      mangaId,
      chapterId,
    ));

    return Provider(
      create: (_) => state,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Observer(
            builder: (context) => state.manga?.title != null
                ? Text(state.manga.title,
                    style: const TextStyle(color: Colors.black))
                : const SizedBox(),
          ),
        ),
        body: Observer(
          builder: (context) => state.pages?.isNotEmpty == true
              ? PageView.builder(
                  itemCount: state.pages.length,
                  itemBuilder: (context, i) {
                    final page = state.pages[i];
                    return _Page(key: ValueKey('page-${page.id}'), page: page);
                  },
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({
    Key key,
    this.page,
  }) : super(key: key);

  final protos.Page page;

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: CachedNetworkImage(imageUrl: page.url),
    );
  }
}
