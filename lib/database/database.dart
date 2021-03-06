import 'package:flutter/material.dart';
import 'package:moor/moor.dart';
import 'package:provider/provider.dart';
import 'package:dartx/dartx.dart';

import 'converters/datetime_converter.dart';
import 'daos/reading_progressions.dart';
import 'migrations/migration.dart';
import 'models/reading_progress.dart';

part 'database.moor.dart';

@UseMoor(tables: [
  ReadingProgressions,
], daos: [
  ReadingProgressionsDao,
], include: {})
class Database extends _$Database {
  Database(DatabaseConnection connection) : super.connect(connection);

  static Database of(BuildContext context) =>
      Provider.of<Database>(context, listen: false);

  @override
  int get schemaVersion => 1;

  final List<Migration> migrations =
      <Migration>[].sortedBy((m) => m.version).toList(growable: false);

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {
          await transaction(() async {
            for (final migration in migrations) {
              if (from < migration.version && to >= migration.version) {
                await migration.migrate(this, migrator);
              }
            }
          });
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}
