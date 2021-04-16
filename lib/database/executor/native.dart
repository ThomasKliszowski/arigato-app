import 'dart:io' as io;
import 'dart:isolate';
import 'package:moor/isolate.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart' hide Database;
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';

import '../database.dart';

const kIsolate = true;

Future<Database> openDatabase() async {
  if (kIsolate == true) {
    final isolate = await _createBackgroundIsolate();
    final connection = await isolate.connect();
    return Database(connection);
  } else {
    return Database(DatabaseConnection.fromExecutor(LazyDatabase(() async {
      final path = await _getDatabasePath();
      return VmDatabase(io.File(path));
    })));
  }
}

Future<void> setupDatabase() async {
  // Fix Sqlite disk I/O error (code 6410)
  // https://github.com/simolus3/moor/issues/876
  if (io.Platform.isAndroid) {
    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;
  }
}

void _startBackground(_IsolateStartRequest request) {
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

Future<MoorIsolate> _createBackgroundIsolate() async {
  final path = await _getDatabasePath();
  final receivePort = ReceivePort();

  await Isolate.spawn(
    _startBackground,
    _IsolateStartRequest(receivePort.sendPort, path),
  );

  return await receivePort.first as MoorIsolate;
}

Future<String> _getDatabasePath() async {
  final dbFolder = await getApplicationDocumentsDirectory();
  return path.join(dbFolder.path, 'arigato.db');
}

// Used to bundle the SendPort and the target path, since isolate entry point
// functions can only take one parameter.
class _IsolateStartRequest {
  const _IsolateStartRequest(this.sendMoorIsolate, this.targetPath);

  final SendPort sendMoorIsolate;
  final String targetPath;
}
