import 'package:moor/moor.dart';

import '../converters/datetime_converter.dart';

/// Store read progress of each [Chapter]s and [Manga]s
@DataClassName('ReadingProgress')
class ReadingProgressions extends Table {
  TextColumn get id => text()();
  TextColumn get mangaId => text()();
  TextColumn get volumeId => text().nullable()();
  RealColumn get volumeNumber => real().nullable()();
  TextColumn get chapterId => text().nullable()();
  RealColumn get chapterNumber => real().nullable()();
  IntColumn get lastPage => integer()();
  RealColumn get progress => real()();
  BoolColumn get isRead => boolean()();
  IntColumn get createdAt => integer()
      .map(const DateTimeConverter())
      .clientDefault(() => const DateTimeConverter().mapToSql(DateTime.now()))
      .nullable()();
  IntColumn get updatedAt => integer()
      .map(const DateTimeConverter())
      .clientDefault(() => const DateTimeConverter().mapToSql(DateTime.now()))
      .nullable()();

  // -----

  @override
  Set<Column> get primaryKey => {id};

  @override
  bool get withoutRowId => true;

  @override
  List<String> get customConstraints => const [
        '''
        CHECK(
          (volume_id IS NOT NULL AND volume_number IS NOT NULL) OR
          (chapter_id IS NOT NULL AND chapter_number IS NOT NULL)
        )'''
      ];
}
