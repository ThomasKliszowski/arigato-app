import 'package:moor/moor.dart';

import '../database.dart';
import '../models/reading_progress.dart';
import '../utils/offline_uuid.dart';

part 'reading_progressions.moor.dart';

@UseDao(
  tables: [ReadingProgressions],
  queries: {
    'lastProgressionsQuery': '''
  SELECT reading_progressions.*
  FROM
    (SELECT manga_id, MAX(chapter_number) AS chapter_number
    FROM reading_progressions
    GROUP BY manga_id) AS latest_reading_progressions
  INNER JOIN reading_progressions
  ON
    reading_progressions.manga_id = latest_reading_progressions.manga_id AND
    reading_progressions.chapter_number = latest_reading_progressions.chapter_number
  ORDER BY reading_progressions.updated_at DESC
  LIMIT :limit
  '''
  },
)
class ReadingProgressionsDao extends DatabaseAccessor<Database>
    with _$ReadingProgressionsDaoMixin {
  ReadingProgressionsDao(Database db) : super(db);

  /// Track [Volume] progress, add or update last progress
  Future<void> trackVolumeProgress({
    @required String mangaId,
    @required String volumeId,
    @required double volumeNumber,
    @required int lastPage,
    @required double progress,
    @required bool isRead,
  }) async {
    return transaction(() async {
      final entity = await getVolumeProgress(volumeId);
      if (entity != null) {
        await _updateVolumeProgress(volumeId, lastPage, progress, isRead);
      } else {
        await _create(ReadingProgressionsCompanion(
          mangaId: Value(mangaId),
          volumeId: Value(volumeId),
          volumeNumber: Value(volumeNumber),
          lastPage: Value(lastPage),
          progress: Value(progress),
          isRead: Value(isRead),
        ));
      }
    });
  }

  /// Retrieve [Volume] progress or null
  Future<ReadingProgress> getVolumeProgress(String volumeId) async {
    final query = select(readingProgressions)
      ..where((e) => e.volumeId.equals(volumeId));
    return query.getSingle();
  }

  /// Track [Chapter] progress, add or update last progress
  Future<void> trackChapterProgress({
    @required String mangaId,
    @required String chapterId,
    @required double chapterNumber,
    @required int lastPage,
    @required double progress,
    @required bool isRead,
  }) async {
    return transaction(() async {
      final entity = await getChapterProgress(chapterId);
      if (entity != null) {
        await _updateChapterProgress(chapterId, lastPage, progress, isRead);
      } else {
        await _create(ReadingProgressionsCompanion(
          mangaId: Value(mangaId),
          chapterId: Value(chapterId),
          chapterNumber: Value(chapterNumber),
          lastPage: Value(lastPage),
          progress: Value(progress),
          isRead: Value(isRead),
        ));
      }
    });
  }

  /// Retrieve [Chapter] progress or null
  Future<ReadingProgress> getChapterProgress(String chapterId) {
    return watchChapterProgress(chapterId).first;
  }

  /// Retrieve [Chapter] progress or null
  Stream<ReadingProgress> watchChapterProgress(String chapterId) {
    final query = select(readingProgressions)
      ..where((e) => e.chapterId.equals(chapterId));
    return query.watchSingle();
  }

  Stream<List<ReadingProgress>> watchLastProgressions() {
    final query = lastProgressionsQuery(5);
    return query.watch();
  }

  // -----

  Future<void> _create(ReadingProgressionsCompanion entity) async {
    return transaction(() async {
      entity = entity.copyWith(
        id: Value(await OfflineUUID.generate()),
      );
      await into(readingProgressions).insert(entity);
    });
  }

  Future<void> _updateVolumeProgress(
    String volumeId,
    int lastPage,
    double progress,
    bool isRead,
  ) async {
    final query = update(readingProgressions)
      ..where((e) => e.volumeId.equals(volumeId));
    await query.write(ReadingProgressionsCompanion(
      lastPage: Value(lastPage),
      progress: Value(progress),
      isRead: Value(isRead),
      updatedAt: Value(DateTime.now()),
    ));
  }

  Future<void> _updateChapterProgress(
    String chapterId,
    int lastPage,
    double progress,
    bool isRead,
  ) async {
    final query = update(readingProgressions)
      ..where((e) => e.chapterId.equals(chapterId));
    await query.write(ReadingProgressionsCompanion(
      lastPage: Value(lastPage),
      progress: Value(progress),
      isRead: Value(isRead),
      updatedAt: Value(DateTime.now()),
    ));
  }
}
