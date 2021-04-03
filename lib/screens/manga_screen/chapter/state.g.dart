// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChapterItemState on ChapterItemStateBase, Store {
  final _$chapterAtom = Atom(name: 'ChapterItemStateBase.chapter');

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

  final _$progressAtom = Atom(name: 'ChapterItemStateBase.progress');

  @override
  ReadingProgress get progress {
    _$progressAtom.reportRead();
    return super.progress;
  }

  @override
  set progress(ReadingProgress value) {
    _$progressAtom.reportWrite(value, super.progress, () {
      super.progress = value;
    });
  }

  @override
  String toString() {
    return '''
chapter: ${chapter},
progress: ${progress}
    ''';
  }
}
