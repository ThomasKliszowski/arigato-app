import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' as hooks;
import 'package:mobx/mobx.dart';

import '../../protos/library.pb.dart';
import '../../services/backend.dart';

part 'state.g.dart';

class MangasListScreenState = MangasListScreenStateBase
    with _$MangasListScreenState;

abstract class MangasListScreenStateBase with Store {
  MangasListScreenStateBase(this.backend);

  final BackendService backend;

  @observable
  List<Manga> mangas;

  Future<void> initialize() async {
    final response = await backend.library.getMangas();
    mangas = response.mangas;
  }

  Future<void> dispose() async {}
}

class MangasListScreenStateHook extends hooks.Hook<MangasListScreenState> {
  const MangasListScreenStateHook(this.backend);

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
    _state = MangasListScreenState(hook.backend)..initialize();
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
