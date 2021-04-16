import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../database/database.dart';
import '../../protos/library.pb.dart' as protos;
import '../../router/app_router.gr.dart';
import '../../screens/reader/state.dart';
import '../../services/backend.dart';
import '../../utils/double.dart';
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
  void didChangeDependencies() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

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
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: const [
            _ReaderView(),
            _AppBar(),
            _Explorer(),
            _NextChapter(),
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
        final mangaTitle = state.manga?.title ?? '';
        final chapterNumber = state.chapter?.number?.normalize() ?? '';
        final chapterTitle = state.chapter?.title ?? '';
        return IgnorePointer(
          ignoring: !state.uiIsVisible,
          child: AnimatedOpacity(
            curve: Curves.decelerate,
            duration: Reader.animationDuration,
            opacity: state.uiIsVisible ? 1 : 0,
            child: AppBar(
              title: Column(
                children: [
                  Text(
                    mangaTitle,
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    'Chapitre $chapterNumber: $chapterTitle',
                    style: TextStyle(color: Colors.grey[500], fontSize: 11),
                  ),
                ],
              ),
              iconTheme: const IconThemeData(color: Colors.black),
              backgroundColor: Colors.grey[50],
            ),
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

          return IgnorePointer(
            ignoring: !state.uiIsVisible,
            child: AnimatedOpacity(
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
            ),
          );
        },
      ),
    );
  }
}

class _NextChapter extends StatelessWidget {
  const _NextChapter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ReaderState>(context);
    return Observer(
      builder: (context) => state.showNextChapter &&
              !state.uiIsVisible &&
              state.nextChapter != null
          ? Positioned(
              right: 10,
              bottom: 10,
              child: SafeArea(
                top: false,
                left: false,
                child: GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).replace(ReaderRoute(
                      manga: state.manga,
                      mangaId: state.manga.id,
                      chapter: state.nextChapter,
                      chapterId: state.nextChapter.id,
                    ));
                  },
                  child: Container(
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: StadiumBorder(),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Prochain chapitre',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(color: Colors.grey[500])),
                          RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16),
                                  children: [
                                TextSpan(
                                    text: state.nextChapter.number.normalize()),
                                const TextSpan(text: ' : '),
                                TextSpan(
                                    text: state.nextChapter.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                            color: Colors.black, fontSize: 16)),
                              ])),
                        ]),
                  ),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
