// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReaderState on ReaderStateBase, Store {
  final _$pageControllerAtom = Atom(name: 'ReaderStateBase.pageController');

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

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

  final _$chapterAtom = Atom(name: 'ReaderStateBase.chapter');

  @override
  protos.Chapter get chapter {
    _$chapterAtom.reportRead();
    return super.chapter;
  }

  @override
  set chapter(protos.Chapter value) {
    _$chapterAtom.reportWrite(value, super.chapter, () {
      super.chapter = value;
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
pageController: ${pageController},
manga: ${manga},
chapter: ${chapter},
pages: ${pages},
uiIsVisible: ${uiIsVisible}
    ''';
  }
}
