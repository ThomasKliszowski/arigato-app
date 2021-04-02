import 'package:moor/moor.dart';

import '../database.dart';
import '../models/volume.dart';

part 'volumes.moor.dart';

@UseDao(tables: [Volumes])
class VolumesDao extends DatabaseAccessor<Database> with _$VolumesDaoMixin {
  VolumesDao(Database db) : super(db);

  Future<void> create(VolumesCompanion entity) async {
    await batch((batch) {
      batch.insert(volumes, entity, mode: InsertMode.insertOrIgnore);
      batch.update(volumes, entity, where: (e) => e.id.equals(entity.id.value));
    });
  }
}
