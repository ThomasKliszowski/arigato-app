// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReaderState on ReaderStateBase, Store {
  final _$mangaAtom = Atom(name: 'ReaderStateBase.manga');

  @override
  protos.Manga get manga {
    _$mangaAtom.reportRead();
    return super.manga;
  }

  @override
  set manga(protos.Manga value) {
    _$mangaAtom.reportWrite(value, super.manga, () {
      super.manga = value;
    });
  }

  final _$pagesAtom = Atom(name: 'ReaderStateBase.pages');

  @override
  List<protos.Page> get pages {
    _$pagesAtom.reportRead();
    return super.pages;
  }

  @override
  set pages(List<protos.Page> value) {
    _$pagesAtom.reportWrite(value, super.pages, () {
      super.pages = value;
    });
  }

  final _$uiIsVisibleAtom = Atom(name: 'ReaderStateBase.uiIsVisible');

  @override
  bool get uiIsVisible {
    _$uiIsVisibleAtom.reportRead();
    return super.uiIsVisible;
  }

  @override
  set uiIsVisible(bool value) {
    _$uiIsVisibleAtom.reportWrite(value, super.uiIsVisible, () {
      super.uiIsVisible = value;
    });
  }

  @override
  String toString() {
    return '''
manga: ${manga},
pages: ${pages},
uiIsVisible: ${uiIsVisible}
    ''';
  }
}
