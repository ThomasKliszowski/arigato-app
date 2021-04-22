// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reading_progressions.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ReadingProgressionsDaoMixin on DatabaseAccessor<Database> {
  $ReadingProgressionsTable get readingProgressions =>
      attachedDatabase.readingProgressions;
  Selectable<ReadingProgress> lastProgressionsQuery(int limit) {
    return customSelect(
        'SELECT reading_progressions.*\n  FROM\n    (SELECT manga_id, MAX(chapter_number) AS chapter_number\n    FROM reading_progressions\n    GROUP BY manga_id) AS latest_reading_progressions\n  INNER JOIN reading_progressions\n  ON\n    reading_progressions.manga_id = latest_reading_progressions.manga_id AND\n    reading_progressions.chapter_number = latest_reading_progressions.chapter_number\n  ORDER BY reading_progressions.updated_at DESC\n  LIMIT :limit',
        variables: [Variable.withInt(limit)],
        readsFrom: {readingProgressions}).map(readingProgressions.mapFromRow);
  }
}
