import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' as hooks;
import 'package:mobx/mobx.dart';

import '../../protos/library.pb.dart' as protos;
import '../../services/backend.dart';

part 'state.g.dart';

class ReaderState = ReaderStateBase with _$ReaderState;

abstract class ReaderStateBase with Store {
  ReaderStateBase(this.backend, this.mangaId, this.chapterId);

  final BackendService backend;
  final String mangaId;
  final String chapterId;

  @observable
  protos.Manga manga;

  @observable
  List<protos.Page> pages;

  Future<void> initialize() async {
    final mangaRequest = backend.library.getManga(mangaId);
    final pagesRequest = backend.library.getChapterPages(chapterId);
    manga = await mangaRequest;
    pages = (await pagesRequest).pages;
  }

  Future<void> dispose() async {}
}

class ReaderStateHook extends hooks.Hook<ReaderState> {
  const ReaderStateHook(this.backend, this.mangaId, this.chapterId);

  final BackendService backend;
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
      hook.backend,
      hook.mangaId,
      hook.chapterId,
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
