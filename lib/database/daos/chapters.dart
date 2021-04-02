import 'package:moor/moor.dart';

import '../database.dart';
import '../models/chapter.dart';

part 'chapters.moor.dart';

@UseDao(tables: [Chapters])
class ChaptersDao extends DatabaseAccessor<Database> with _$ChaptersDaoMixin {
  ChaptersDao(Database db) : super(db);

  Future<void> create(ChaptersCompanion entity) async {
    await batch((batch) {
      batch.insert(chapters, entity, mode: InsertMode.insertOrIgnore);
      batch.update(chapters, entity,
          where: (e) => e.id.equals(entity.id.value));
    });
  }
}
