import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../protos/library.pb.dart';
import '../../router/app_router.gr.dart';
import '../../screens/manga_screen/state.dart';
import '../../services/backend.dart';

class MangaScreen extends HookWidget {
  const MangaScreen({
    Key key,
    @PathParam('mangaId') this.mangaId,
  }) : super(key: key);

  final String mangaId;

  @override
  Widget build(BuildContext context) {
    final state =
        use(MangasScreenStateHook(BackendService.of(context), mangaId));

    return Provider(
      create: (_) => state,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, _) => [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverToBoxAdapter(
                child: AspectRatio(
                  aspectRatio: 2 / 3,
                  child: Observer(
                    builder: (context) => state.manga?.cover != null
                        ? CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: state.manga.cover,
                          )
                        : Container(color: Colors.grey[200]),
                  ),
                ),
              ),
            )
          ],
          body: Builder(
            builder: (context) => CustomScrollView(
              slivers: [
                SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
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
                const _Chapters()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Chapters extends StatelessWidget {
  const _Chapters({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MangasScreenState>(context);
    return Observer(
      builder: (context) => state.chapters?.isEmpty == false
          ? SliverList(
              delegate: SliverChildBuilderDelegate(
              (context, i) {
                final chapter = state.chapters[i];
                return _Chapter(
                  key: ValueKey('chapter-${chapter.id}'),
                  chapter: chapter,
                );
              },
              childCount: state.chapters.length,
            ))
          : const SliverToBoxAdapter(child: SizedBox()),
    );
  }
}

class _Chapter extends StatelessWidget {
  const _Chapter({Key key, this.chapter}) : super(key: key);

  final Chapter chapter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () => AutoRouter.of(context).push(ReaderRoute(
          mangaId: chapter.mangaId,
          chapterId: chapter.id,
        )),
        child: Row(
          children: [
            Text(chapter.title, style: const TextStyle(color: Colors.black)),
            const SizedBox(width: 10),
            Text('${chapter.pageCount} pages',
                style: TextStyle(color: Colors.grey[400])),
            Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[300],
                    ))),
          ],
        ),
      ),
    );
  }
}
