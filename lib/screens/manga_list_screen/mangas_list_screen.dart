import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../database/database.dart';
import '../../protos/library.pb.dart' as protos;
import '../../router/app_router.gr.dart';
import '../../services/backend.dart';
import 'state.dart';

class MangasListScreen extends HookWidget {
  const MangasListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = use(MangasListScreenStateHook(
      database: Database.of(context),
      backend: BackendService.of(context),
    ));
    return Provider(
      create: (_) => state,
      child: const Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverSafeArea(
              sliver: SliverToBoxAdapter(child: _Header()),
              bottom: false,
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(child: _ResumeReading()),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(child: _MangasListHeader()),
            _MangasList()
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('ありがと',
        textAlign: TextAlign.center,
        style: TextStyle(
            height: 1.2,
            fontFamily: 'RocknRollOne',
            fontSize: 70,
            letterSpacing: -8));
  }
}

class _ResumeReading extends StatelessWidget {
  const _ResumeReading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MangasListScreenState>(context, listen: false);
    return Observer(
      builder: (context) => state.readings.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 10),
                  child: Text(
                    'Reprenez votre lecture',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (context, i) {
                      final reading = state.readings[i];
                      return _Reading(
                        key: ValueKey('reading-${reading.chapter?.id ?? i}'),
                        reading: reading,
                      );
                    },
                    itemCount: state.readings.length,
                  ),
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}

class _Reading extends StatelessWidget {
  const _Reading({Key key, this.reading}) : super(key: key);

  final Reading reading;

  @override
  Widget build(BuildContext context) {
    final progress = (reading.progress.progress * 100).round();
    final chapterNumber = reading.chapter.number.toStringAsFixed(0);
    return GestureDetector(
      onTap: () => AutoRouter.of(context).push(ReaderRoute(
        mangaId: reading.manga.id,
        chapterId: reading.chapter.id,
        manga: reading.manga,
        chapter: reading.chapter,
      )),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  if (reading.manga?.cover?.isNotEmpty == true)
                    CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: reading.manga.cover,
                    )
                  else
                    Container(color: Colors.grey[200]),
                  const Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          colors: [Colors.black38, Colors.transparent],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text('$progress%',
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                )),
                      ))
                ],
              ),
            ),
          ),
          Text('Chapitre $chapterNumber',
              style: Theme.of(context).textTheme.caption.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  )),
        ],
      ),
    );
  }
}

class _MangasListHeader extends StatelessWidget {
  const _MangasListHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      child: Text(
        'Tous les mangas',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

class _MangasList extends StatelessWidget {
  const _MangasList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MangasListScreenState>(context, listen: false);
    return Observer(
      builder: (context) => state.mangas?.isNotEmpty == true
          ? SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) => _MangaItem(state.mangas[i]),
                    childCount: state.mangas.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2 / 3,
                  )),
            )
          : const SliverToBoxAdapter(child: SizedBox()),
    );
  }
}

class _MangaItem extends StatelessWidget {
  const _MangaItem(this.manga, {Key key}) : super(key: key);

  final protos.Manga manga;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AutoRouter.of(context).push(MangaRoute(
        manga: manga,
        mangaId: manga.id,
      )),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: manga.cover?.isNotEmpty == true
                  ? CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: manga.cover,
                    )
                  : Container(color: Colors.grey[200]),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            manga.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
