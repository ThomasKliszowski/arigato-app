import 'package:moor/moor.dart';

import '../database.dart';

/// Interface class to implement when creating a new migration
abstract class Migration {
  int get version;
  Future<void> migrate(Database db, Migrator migrator);
}
