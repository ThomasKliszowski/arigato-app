import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' as hooks;
import 'package:mobx/mobx.dart';

import '../../../database/database.dart';
import '../../../protos/library.pb.dart' as protos;
import '../../../services/backend.dart';

part 'state.g.dart';

class ChapterItemState = ChapterItemStateBase with _$ChapterItemState;

abstract class ChapterItemStateBase with Store {
  ChapterItemStateBase({
    this.database,
    this.backend,
    this.chapter,
    this.chapterId,
  });

  final Database database;
  final BackendService backend;
  final String chapterId;
  StreamSubscription _progressSub;

  @observable
  protos.Chapter chapter;

  @observable
  ReadingProgress progress;

  // -----

  void _watchProgress() {
    _progressSub?.cancel();
    _progressSub = database.readingProgressionsDao
        .watchChapterProgress(chapterId)
        .listen((value) => progress = value);
  }

  // -----

  Future<void> initialize() async {
    _watchProgress();
    chapter ??= await backend.library.getChapter(chapterId);
  }

  Future<void> dispose() async {
    _progressSub?.cancel();
  }
}

class ChapterItemStateHook extends hooks.Hook<ChapterItemState> {
  const ChapterItemStateHook({
    this.database,
    this.backend,
    this.chapter,
    this.chapterId,
  });

  final Database database;
  final BackendService backend;
  final protos.Chapter chapter;
  final String chapterId;

  @override
  _ChapterItemStateHookState createState() => _ChapterItemStateHookState();
}

class _ChapterItemStateHookState
    extends hooks.HookState<ChapterItemState, ChapterItemStateHook> {
  ChapterItemState _state;

  @override
  void initHook() {
    super.initHook();
    _state = ChapterItemState(
      database: hook.database,
      backend: hook.backend,
      chapter: hook.chapter,
      chapterId: hook.chapterId,
    )..initialize();
  }

  @override
  void didUpdateHook(ChapterItemStateHook oldHook) {
    super.didUpdateHook(oldHook);
  }

  @override
  ChapterItemState build(BuildContext context) {
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
