import 'package:moor/moor.dart';

import '../database.dart';
import '../models/manga.dart';

part 'mangas.moor.dart';

@UseDao(tables: [Mangas])
class MangasDao extends DatabaseAccessor<Database> with _$MangasDaoMixin {
  MangasDao(Database db) : super(db);

  Future<void> create(MangasCompanion entity) async {
    await batch((batch) {
      batch.insert(mangas, entity, mode: InsertMode.insertOrIgnore);
      batch.update(mangas, entity, where: (e) => e.id.equals(entity.id.value));
    });
  }
}
