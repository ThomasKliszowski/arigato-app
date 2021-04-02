import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' as hooks;
import 'package:mobx/mobx.dart';

import '../../database/database.dart';
import '../../protos/library.pb.dart' as protos;
import '../../services/backend.dart';

part 'state.g.dart';

class MangasListScreenState = MangasListScreenStateBase
    with _$MangasListScreenState;

abstract class MangasListScreenStateBase with Store {
  MangasListScreenStateBase({this.database, this.backend});

  final Database database;
  final BackendService backend;
  StreamSubscription _progressionsSub;

  @observable
  List<protos.Manga> mangas;

  @observable
  List<Reading> readings = const [];

  // -----

  @action
  Future<void> _setReadings(List<ReadingProgress> value) async {
    final readingsFuture = value.map((p) async {
      final mangaRequest = p.mangaId != null
          ? backend.library.getManga(p.mangaId)
          : Future.value(null);
      final chapterRequest = p.chapterId != null
          ? backend.library.getChapter(p.chapterId)
          : Future.value(null);
      return Reading(
        progress: p,
        manga: await mangaRequest,
        chapter: await chapterRequest,
      );
    });
    readings = await Future.wait(readingsFuture);
  }

  void _watchProgressions() {
    _progressionsSub?.cancel();
    _progressionsSub = database.readingProgressionsDao
        .watchLastProgressions()
        .listen(_setReadings);
  }

  // -----

  Future<void> initialize() async {
    _watchProgressions();
    mangas = (await backend.library.getMangas()).mangas;
  }

  Future<void> dispose() async {
    _progressionsSub?.cancel();
  }
}

class MangasListScreenStateHook extends hooks.Hook<MangasListScreenState> {
  const MangasListScreenStateHook({
    this.database,
    this.backend,
  });

  final Database database;
  final BackendService backend;

  @override
  _MangasListScreenStateHookState createState() =>
      _MangasListScreenStateHookState();
}

class _MangasListScreenStateHookState
    extends hooks.HookState<MangasListScreenState, MangasListScreenStateHook> {
  MangasListScreenState _state;

  @override
  void initHook() {
    super.initHook();
    _state = MangasListScreenState(
      database: hook.database,
      backend: hook.backend,
    )..initialize();
  }

  @override
  void didUpdateHook(MangasListScreenStateHook oldHook) {
    super.didUpdateHook(oldHook);
  }

  @override
  MangasListScreenState build(BuildContext context) {
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

class Reading {
  const Reading({
    this.progress,
    this.manga,
    this.chapter,
  });

  final ReadingProgress progress;
  final protos.Manga manga;
  final protos.Chapter chapter;
}
