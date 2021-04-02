import 'package:moor/moor.dart';

import '../converters/datetime_converter.dart';

@DataClassName('Chapter')
class Chapters extends Table {
  TextColumn get id => text().nullable()();
  RealColumn get number => real()();
  TextColumn get description => text().nullable()();
  IntColumn get publicationDate =>
      integer().map(const DateTimeConverter()).nullable()();
  TextColumn get cover => text().nullable()();
  BoolColumn get isLicensed => boolean()();
  IntColumn get pageCount => integer()();
  TextColumn get mangaId => text()();
  TextColumn get volumeId => text().nullable()();
  IntColumn get createdAt => integer().map(const DateTimeConverter())();
  IntColumn get updatedAt => integer().map(const DateTimeConverter())();

  // -----

  @override
  Set<Column> get primaryKey => {id};

  @override
  bool get withoutRowId => true;
}
