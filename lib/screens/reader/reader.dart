import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../database/database.dart';
import '../../protos/library.pb.dart' as protos;
import '../../screens/reader/state.dart';
import '../../services/backend.dart';
import '../../widgets/reader_explorer/reader_explorer.dart';
import '../../widgets/reader_view.dart';

class Reader extends StatefulHookWidget {
  const Reader({
    Key key,
    @PathParam('mangaId') this.mangaId,
    @PathParam('chapterId') this.chapterId,
    this.manga,
    this.chapter,
  }) : super(key: key);

  static const animationDuration = Duration(milliseconds: 200);
  final String mangaId;
  final String chapterId;
  final protos.Manga manga;
  final protos.Chapter chapter;

  @override
  _ReaderState createState() => _ReaderState();
}

class _ReaderState extends State<Reader> {
  @override
  Widget build(BuildContext context) {
    final state = use(ReaderStateHook(
      database: Database.of(context),
      backend: BackendService.of(context),
      mangaId: widget.mangaId,
      chapterId: widget.chapterId,
      manga: widget.manga,
      chapter: widget.chapter,
    ));

    return Provider(
      create: (_) => state,
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Stack(
          fit: StackFit.expand,
          children: const [
            _ReaderView(),
            _AppBar(),
            _Explorer(),
          ],
        ),
      ),
    );
  }
}

class _ReaderView extends StatelessWidget {
  const _ReaderView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ReaderState>(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => state.toggleShowUI(),
      child: Observer(builder: (context) {
        return state.pageController != null && state.pages?.isNotEmpty == true
            ? ReaderView(
                itemCount: state.pages.length,
                getPhotoUrl: (i) => state.pages[i].url,
                pageController: state.pageController,
              )
            : const SizedBox();
      }),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ReaderState>(context);
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Observer(builder: (context) {
        return AnimatedOpacity(
          curve: Curves.decelerate,
          duration: Reader.animationDuration,
          opacity: state.uiIsVisible ? 1 : 0,
          child: AppBar(
            title: Text(
              state.manga?.title ?? '',
              style: const TextStyle(color: Colors.black),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.grey[50],
          ),
        );
      }),
    );
  }
}

class _Explorer extends StatelessWidget {
  const _Explorer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ReaderState>(context);
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Observer(
        builder: (context) {
          final double height =
              math.min(MediaQuery.of(context).size.height * 0.3, 300);

          return AnimatedOpacity(
            duration: Reader.animationDuration,
            curve: Curves.decelerate,
            opacity: state.uiIsVisible ? 1 : 0,
            child: SizedBox(
              height: height,
              child: Observer(
                builder: (context) => state.pageController != null
                    ? ReaderExplorer(
                        itemCount: state.pages?.length ?? 0,
                        getPhotoUrl: (i) => state.pages[i].url,
                        pageController: state.pageController,
                      )
                    : const SizedBox(),
              ),
            ),
          );
        },
      ),
    );
  }
}
