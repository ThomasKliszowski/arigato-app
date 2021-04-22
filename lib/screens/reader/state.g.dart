// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReaderState on ReaderStateBase, Store {
  Computed<int> _$pagesCountComputed;

  @override
  int get pagesCount =>
      (_$pagesCountComputed ??= Computed<int>(() => super.pagesCount,
              name: 'ReaderStateBase.pagesCount'))
          .value;

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

  final _$nextChapterAtom = Atom(name: 'ReaderStateBase.nextChapter');

  @override
  protos.Chapter get nextChapter {
    _$nextChapterAtom.reportRead();
    return super.nextChapter;
  }

  @override
  set nextChapter(protos.Chapter value) {
    _$nextChapterAtom.reportWrite(value, super.nextChapter, () {
      super.nextChapter = value;
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

  final _$showNextChapterAtom = Atom(name: 'ReaderStateBase.showNextChapter');

  @override
  bool get showNextChapter {
    _$showNextChapterAtom.reportRead();
    return super.showNextChapter;
  }

  @override
  set showNextChapter(bool value) {
    _$showNextChapterAtom.reportWrite(value, super.showNextChapter, () {
      super.showNextChapter = value;
    });
  }

  final _$currentPageAtom = Atom(name: 'ReaderStateBase.currentPage');

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

  @override
  String toString() {
    return '''
pageController: ${pageController},
manga: ${manga},
chapter: ${chapter},
nextChapter: ${nextChapter},
pages: ${pages},
uiIsVisible: ${uiIsVisible},
showNextChapter: ${showNextChapter},
currentPage: ${currentPage},
pagesCount: ${pagesCount}
    ''';
  }
}
