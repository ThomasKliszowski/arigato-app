import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../protos/library.pb.dart';
import '../../router/app_router.gr.dart';
import '../../services/backend.dart';
import 'state.dart';

class MangasListScreen extends HookWidget {
  const MangasListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = use(MangasListScreenStateHook(BackendService.of(context)));

    return Provider(
      create: (_) => state,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverSafeArea(
              bottom: false,
              sliver: SliverToBoxAdapter(
                  child: Text('ありがと',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.2,
                          fontFamily: 'RocknRollOne',
                          fontSize: 70,
                          letterSpacing: -8))),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            Observer(
              builder: (context) => state.mangas?.isNotEmpty == true
                  ? SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, i) => _MangaItem(state.mangas[i]),
                            childCount: state.mangas.length,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 30,
                            crossAxisSpacing: 10,
                            childAspectRatio: 2 / 3,
                          )),
                    )
                  : const SliverToBoxAdapter(child: SizedBox()),
            ),
          ],
        ),
      ),
    );
  }
}

class _MangaItem extends StatelessWidget {
  const _MangaItem(this.manga, {Key key}) : super(key: key);

  final Manga manga;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AutoRouter.of(context).push(MangaRoute(mangaId: manga.id)),
      child: Column(
        children: [
          Expanded(
              child: manga.cover?.isNotEmpty == true
                  ? CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: manga.cover,
                    )
                  : Container(color: Colors.grey[200])),
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
