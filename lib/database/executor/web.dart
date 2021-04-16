import 'package:moor/moor.dart';
import 'package:moor/moor_web.dart';

import '../database.dart';

Future<Database> openDatabase() async {
  final executor =
      WebDatabase.withStorage(MoorWebStorage.indexedDbIfSupported('arigato'));
  final connection = DatabaseConnection.fromExecutor(executor);
  return Database(connection);
}

Future<void> setupDatabase() async {}
