import 'dart:io' as io;
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:moor/ffi.dart';
import 'package:moor/isolate.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:dartx/dartx.dart';

import 'migrations/migration.dart';

part 'database.moor.dart';

@UseMoor(tables: [], daos: [], include: {})
class Database extends _$Database {
  Database(DatabaseConnection connection) : super.connect(connection);

  static Database of(BuildContext context) =>
      Provider.of<Database>(context, listen: false);

  // Open a new database connection
  static DatabaseConnection openConnection() =>
      DatabaseConnection.fromExecutor(LazyDatabase(() async {
        final path = await getDatabasePath();
        return VmDatabase(io.File(path));
      }));

  // Open a new database connection on a background Isolate
  static Future<Database> openDatabaseOnIsolate() async {
    final isolate = await _createBackgroundIsolate();
    final connection = await isolate.connect();
    return Database(connection);
  }

  @override
  int get schemaVersion => 1;

  final List<Migration> migrations =
      [].sortedBy((m) => m.version).toList(growable: false);

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

  static Future<void> setupMoorFfi() async {
    // Fix Sqlite disk I/O error (code 6410)
    // https://github.com/simolus3/moor/issues/876
    if (io.Platform.isAndroid) {
      final cachebase = (await getTemporaryDirectory()).path;
      sqlite3.tempDirectory = cachebase;
    }
  }

  static void _startBackground(_IsolateStartRequest request) {
    // this is the entry point from the background isolate! Let's create
    // the database from the path we received
    final executor = VmDatabase(io.File(request.targetPath));
    // we're using MoorIsolate.inCurrent here as this method already runs on a
    // background isolate. If we used MoorIsolate.spawn, a third isolate would be
    // started which is not what we want!
    final moorIsolate =
        MoorIsolate.inCurrent(() => DatabaseConnection.fromExecutor(executor));
    // inform the starting isolate about this, so that it can call .connect()
    request.sendMoorIsolate.send(moorIsolate);
  }

  static Future<MoorIsolate> _createBackgroundIsolate() async {
    final path = await getDatabasePath();
    final receivePort = ReceivePort();

    await Isolate.spawn(
      _startBackground,
      _IsolateStartRequest(receivePort.sendPort, path),
    );

    return await receivePort.first as MoorIsolate;
  }

  static Future<String> getDatabasePath() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    return p.join(dbFolder.path, 'arigato.db');
  }
}

// Used to bundle the SendPort and the target path, since isolate entry point
// functions can only take one parameter.
class _IsolateStartRequest {
  const _IsolateStartRequest(this.sendMoorIsolate, this.targetPath);

  final SendPort sendMoorIsolate;
  final String targetPath;
}
