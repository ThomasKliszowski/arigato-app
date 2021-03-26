import 'package:moor/moor.dart';

import '../database.dart';

abstract class Migration {
  int get version;
  Future<void> migrate(Database db, Migrator migrator);
}
