import 'package:moor/moor.dart';

import '../converters/datetime_converter.dart';

@DataClassName('Volume')
class Volumes extends Table {
  TextColumn get id => text()();
  RealColumn get number => real()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get ean13 => text().nullable()();
  TextColumn get cover => text().nullable()();
  IntColumn get pageCount => integer()();
  TextColumn get mangaId => text()();
  IntColumn get publicationDate =>
      integer().map(const DateTimeConverter()).nullable()();
  IntColumn get createdAt => integer().map(const DateTimeConverter())();
  IntColumn get updatedAt => integer().map(const DateTimeConverter())();

  // -----

  @override
  Set<Column> get primaryKey => {id};

  @override
  bool get withoutRowId => true;
}
