import 'dart:ui';

import 'package:arigato/database/utils/statically.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../protos/library.pb.dart' as protos;
import '../../router/app_router.gr.dart';
import '../../screens/manga_screen/state.dart';
import '../../services/backend.dart';
import 'chapter/chapter.dart';

class MangaScreen extends HookWidget {
  const MangaScreen({
    Key key,
    @PathParam('mangaId') this.mangaId,
    this.manga,
  }) : super(key: key);

  final String mangaId;
  final protos.Manga manga;

  @override
  Widget build(BuildContext context) {
    final state = use(MangasScreenStateHook(
      backend: BackendService.of(context),
      manga: manga,
      mangaId: mangaId,
    ));

    return Provider(
      create: (_) => state,
      child: Scaffold(
        body: Stack(
          fit: StackFit.passthrough,
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Observer(
                    builder: (context) => state.manga?.cover != null
                        ? CachedNetworkImage(
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter,
                            imageUrl: Statically.buildUrl(state.manga.cover),
                            height: MediaQuery.of(context).size.height * 0.6)
                        : Container(
                            color: Colors.grey[200],
                            height: MediaQuery.of(context).size.height * 0.6),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Observer(
                          builder: (context) => state.manga?.title == null
                              ? Container(color: Colors.grey[100], height: 30)
                              : Text(state.manga.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)))),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Observer(
                        builder: (context) => state.manga?.description == null
                            ? Container(color: Colors.grey[100], height: 30)
                            : Text(state.manga.description,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(color: Colors.black))),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text('Chapitres',
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ),
                const _Chapters(),
                const SliverToBoxAdapter(child: SizedBox(height: 40)),
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.black12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Chapters extends StatelessWidget {
  const _Chapters({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MangasScreenState>(context, listen: false);
    return Observer(
      builder: (context) => state.chapters?.isEmpty == false
          ? SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, i) {
                      final chapter = state.chapters[i];
                      return ChapterItem(
                          key: ValueKey('chapter-${chapter.id}'),
                          chapterId: chapter.id,
                          chapter: chapter,
                          onTap: () => AutoRouter.of(context).push(ReaderRoute(
                                mangaId: chapter.mangaId,
                                chapterId: chapter.id,
                                manga: state.manga,
                                chapter: chapter,
                              )));
                    },
                    childCount: state.chapters.length,
                  )),
            )
          : const SliverToBoxAdapter(child: SizedBox()),
    );
  }
}
