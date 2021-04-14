import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' as hooks;
import 'package:mobx/mobx.dart';

import '../../database/database.dart';
import '../../protos/library.pb.dart' as protos;
import '../../services/backend.dart';

part 'state.g.dart';

class ReaderState = ReaderStateBase with _$ReaderState;

abstract class ReaderStateBase with Store {
  ReaderStateBase({
    this.database,
    this.backend,
    this.manga,
    this.mangaId,
    this.chapter,
    this.chapterId,
  });

  final Database database;
  final BackendService backend;
  final String mangaId;
  final String chapterId;

  @observable
  PageController pageController;

  @observable
  protos.Manga manga;

  @observable
  protos.Chapter chapter;

  @observable
  protos.Chapter nextChapter;

  @observable
  List<protos.Page> pages;

  @observable
  bool uiIsVisible = false;

  @observable
  bool showNextChapter = false;

  void hideUI() {
    if (uiIsVisible == true) {
      uiIsVisible = false;
    }
  }

  void showUI() {
    if (uiIsVisible == false) {
      uiIsVisible = true;
    }
  }

  void toggleShowUI() => uiIsVisible = !uiIsVisible;

  void _onPageEvent() {
    final pageCursor = pageController.page;
    final page = pageCursor.toInt();
    if (pageCursor == page) {
      _onPageChange(page);
    }
  }

  void _maybeShowNextChapter(int page) {
    if (page == pages.length - 1) {
      showNextChapter = true;
      loadNextChapter();
    } else {
      showNextChapter = false;
    }
  }

  Future<void> _onPageChange(int page) async {
    _maybeShowNextChapter(page);

    await database.readingProgressionsDao.trackChapterProgress(
      mangaId: mangaId,
      chapterId: chapterId,
      chapterNumber: chapter.number,
      lastPage: page,
      progress: (page + 1) / chapter.pageCount,
      isRead: (page + 1) == chapter.pageCount,
    );
  }

  Future<void> loadNextChapter() async {
    nextChapter ??= await backend.library.findNextChapter(chapterId);
  }

  // -----

  Future<void> initialize() async {
    final readingProgress =
        await database.readingProgressionsDao.getChapterProgress(chapterId);
    final initialPage = readingProgress?.lastPage ?? 0;
    pageController = PageController(initialPage: initialPage)
      ..addListener(_onPageEvent);
    final mangaRequest = backend.library.getManga(mangaId);
    final chapterRequest = backend.library.getChapter(chapterId);
    final pagesRequest = backend.library.getChapterPages(chapterId);
    manga = await mangaRequest;
    chapter = await chapterRequest;
    pages = (await pagesRequest).pages;
    _maybeShowNextChapter(initialPage);
  }

  Future<void> dispose() async {
    pageController.removeListener(_onPageEvent);
    pageController.dispose();
  }
}

class ReaderStateHook extends hooks.Hook<ReaderState> {
  const ReaderStateHook({
    this.database,
    this.backend,
    this.manga,
    this.chapter,
    this.mangaId,
    this.chapterId,
  });

  final Database database;
  final BackendService backend;
  final protos.Manga manga;
  final protos.Chapter chapter;
  final String mangaId;
  final String chapterId;

  @override
  _ReaderStateHookState createState() => _ReaderStateHookState();
}

class _ReaderStateHookState
    extends hooks.HookState<ReaderState, ReaderStateHook> {
  ReaderState _state;

  @override
  void initHook() {
    super.initHook();
    _state = ReaderState(
      database: hook.database,
      backend: hook.backend,
      manga: hook.manga,
      mangaId: hook.mangaId,
      chapter: hook.chapter,
      chapterId: hook.chapterId,
    )..initialize();
  }

  @override
  void didUpdateHook(ReaderStateHook oldHook) {
    super.didUpdateHook(oldHook);
  }

  @override
  ReaderState build(BuildContext context) {
    return _state;
  }

  @override
  void dispose() {
    _state.dispose();
  }

  @override
  bool get debugHasShortDescription => false;

  @override
  String get debugLabel => 'useAnimationController';
}
