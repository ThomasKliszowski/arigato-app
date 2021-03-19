import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart' as hooks;
import 'package:mobx/mobx.dart';
import 'package:dartx/dartx.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

part 'state.g.dart';

class ReaderExplorerState = ReaderExplorerStateBase with _$ReaderExplorerState;

abstract class ReaderExplorerStateBase with Store {
  PageController pageController;
  ItemScrollController scrollController;
  ItemPositionsListener scrollListener;

  @observable
  int currentPage;

  void setActivePage(int index) {
    pageController.jumpToPage(index);
  }

  @action
  void _onPageScrollUpdate() {
    final oldPage = currentPage;
    final newPage = pageController.page.round();
    if (oldPage != newPage) {
      currentPage = newPage;

      final itemPosition = scrollListener.itemPositions.value
          .firstOrNullWhere((position) => position.index == currentPage);

      double alignment;
      if (itemPosition == null) {
        alignment = 0.1;
      } else if (itemPosition.itemLeadingEdge < 0) {
        alignment = 0.1;
      } else if (itemPosition.itemTrailingEdge > 1) {
        final size =
            itemPosition.itemTrailingEdge - itemPosition.itemLeadingEdge;
        alignment = 1 - size - 0.1;
      }

      if (alignment != null) {
        scrollController.scrollTo(
            alignment: alignment,
            index: currentPage,
            opacityAnimationWeights: [20, 20, 60],
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut);
      }
    }
  }

  Future<void> initialize(PageController pageController) async {
    this.pageController = pageController;
    currentPage = pageController.initialPage;
    pageController.addListener(_onPageScrollUpdate);
    scrollController = ItemScrollController();
    scrollListener = ItemPositionsListener.create();
  }

  Future<void> dispose() async {
    pageController.removeListener(_onPageScrollUpdate);
  }
}

class ReaderExplorerStateHook extends hooks.Hook<ReaderExplorerState> {
  const ReaderExplorerStateHook(this.pageController);

  final PageController pageController;

  @override
  _ReaderExplorerStateHookState createState() =>
      _ReaderExplorerStateHookState();
}

class _ReaderExplorerStateHookState
    extends hooks.HookState<ReaderExplorerState, ReaderExplorerStateHook> {
  ReaderExplorerState _state;

  @override
  void initHook() {
    super.initHook();
    _state ??= ReaderExplorerState();
    _state.initialize(hook.pageController);
  }

  @override
  void didUpdateHook(ReaderExplorerStateHook oldHook) {
    super.didUpdateHook(oldHook);
  }

  @override
  ReaderExplorerState build(BuildContext context) {
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
