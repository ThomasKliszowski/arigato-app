import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' as hooks;
import 'package:mobx/mobx.dart';

import '../../protos/library.pb.dart';
import '../../services/backend.dart';

part 'state.g.dart';

class MangasScreenState = MangasScreenStateBase with _$MangasScreenState;

abstract class MangasScreenStateBase with Store {
  MangasScreenStateBase({
    this.backend,
    this.manga,
    this.mangaId,
  });

  final BackendService backend;
  final String mangaId;

  @observable
  Manga manga;

  @observable
  List<Chapter> chapters;

  Future<void> initialize() async {
    final mangaRequest = backend.library.getManga(mangaId);
    final chaptersRequest = backend.library.getChapters(mangaId);
    manga = await mangaRequest;
    chapters = (await chaptersRequest).chapters;
  }

  Future<void> dispose() async {}
}

class MangasScreenStateHook extends hooks.Hook<MangasScreenState> {
  const MangasScreenStateHook({
    this.backend,
    this.manga,
    this.mangaId,
  });

  final BackendService backend;
  final Manga manga;
  final String mangaId;

  @override
  _MangasScreenStateHookState createState() => _MangasScreenStateHookState();
}

class _MangasScreenStateHookState
    extends hooks.HookState<MangasScreenState, MangasScreenStateHook> {
  MangasScreenState _state;

  @override
  void initHook() {
    super.initHook();
    _state = MangasScreenState(
      backend: hook.backend,
      manga: hook.manga,
      mangaId: hook.mangaId,
    )..initialize();
  }

  @override
  void didUpdateHook(MangasScreenStateHook oldHook) {
    super.didUpdateHook(oldHook);
  }

  @override
  MangasScreenState build(BuildContext context) {
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
