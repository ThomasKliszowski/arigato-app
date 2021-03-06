// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MangasScreenState on MangasScreenStateBase, Store {
  final _$mangaAtom = Atom(name: 'MangasScreenStateBase.manga');

  @override
  Manga get manga {
    _$mangaAtom.reportRead();
    return super.manga;
  }

  @override
  set manga(Manga value) {
    _$mangaAtom.reportWrite(value, super.manga, () {
      super.manga = value;
    });
  }

  final _$chaptersAtom = Atom(name: 'MangasScreenStateBase.chapters');

  @override
  List<Chapter> get chapters {
    _$chaptersAtom.reportRead();
    return super.chapters;
  }

  @override
  set chapters(List<Chapter> value) {
    _$chaptersAtom.reportWrite(value, super.chapters, () {
      super.chapters = value;
    });
  }

  @override
  String toString() {
    return '''
manga: ${manga},
chapters: ${chapters}
    ''';
  }
}
