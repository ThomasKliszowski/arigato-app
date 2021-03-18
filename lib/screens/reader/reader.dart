import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../protos/library.pb.dart' as protos;
import '../../screens/reader/state.dart';
import '../../services/backend.dart';
import '../../widgets/reader_view.dart';

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
        backgroundColor: Colors.grey[900],
        body: Stack(
          fit: StackFit.passthrough,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => state.toggleShowUI(),
              child: Observer(builder: (context) {
                return state.pages?.isNotEmpty == true
                    ? ReaderView(
                        itemCount: state.pages.length,
                        getPhotoUrl: (i) => state.pages[i].url,
                      )
                    : const SizedBox();
              }),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Observer(
                builder: (context) => state.uiIsVisible
                    ? AppBar(
                        title: Text(
                          state.manga.title,
                          style: const TextStyle(color: Colors.black),
                        ),
                        iconTheme: const IconThemeData(color: Colors.black),
                        backgroundColor: Colors.white,
                      )
                    : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
