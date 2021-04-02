import 'package:moor/moor.dart';

import '../converters/datetime_converter.dart';

@DataClassName('Manga')
class Mangas extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get cover => text().nullable()();
  TextColumn get authors => text().nullable()();
  IntColumn get otherTitles => integer()();
  IntColumn get createdAt => integer().map(const DateTimeConverter())();
  IntColumn get updatedAt => integer().map(const DateTimeConverter())();

  // -----

  @override
  Set<Column> get primaryKey => {id};

  @override
  bool get withoutRowId => true;
}
