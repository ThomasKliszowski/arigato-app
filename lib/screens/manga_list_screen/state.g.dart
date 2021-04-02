// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MangasListScreenState on MangasListScreenStateBase, Store {
  final _$mangasAtom = Atom(name: 'MangasListScreenStateBase.mangas');

  @override
  List<protos.Manga> get mangas {
    _$mangasAtom.reportRead();
    return super.mangas;
  }

  @override
  set mangas(List<protos.Manga> value) {
    _$mangasAtom.reportWrite(value, super.mangas, () {
      super.mangas = value;
    });
  }

  final _$readingsAtom = Atom(name: 'MangasListScreenStateBase.readings');

  @override
  List<Reading> get readings {
    _$readingsAtom.reportRead();
    return super.readings;
  }

  @override
  set readings(List<Reading> value) {
    _$readingsAtom.reportWrite(value, super.readings, () {
      super.readings = value;
    });
  }

  final _$_setReadingsAsyncAction =
      AsyncAction('MangasListScreenStateBase._setReadings');

  @override
  Future<void> _setReadings(List<ReadingProgress> value) {
    return _$_setReadingsAsyncAction.run(() => super._setReadings(value));
  }

  @override
  String toString() {
    return '''
mangas: ${mangas},
readings: ${readings}
    ''';
  }
}
