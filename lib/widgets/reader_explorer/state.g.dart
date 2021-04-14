// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReaderExplorerState on ReaderExplorerStateBase, Store {
  final _$currentPageAtom = Atom(name: 'ReaderExplorerStateBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$itemCountAtom = Atom(name: 'ReaderExplorerStateBase.itemCount');

  @override
  int get itemCount {
    _$itemCountAtom.reportRead();
    return super.itemCount;
  }

  @override
  set itemCount(int value) {
    _$itemCountAtom.reportWrite(value, super.itemCount, () {
      super.itemCount = value;
    });
  }

  final _$ReaderExplorerStateBaseActionController =
      ActionController(name: 'ReaderExplorerStateBase');

  @override
  void _onPageScrollUpdate() {
    final _$actionInfo = _$ReaderExplorerStateBaseActionController.startAction(
        name: 'ReaderExplorerStateBase._onPageScrollUpdate');
    try {
      return super._onPageScrollUpdate();
    } finally {
      _$ReaderExplorerStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
itemCount: ${itemCount}
    ''';
  }
}
