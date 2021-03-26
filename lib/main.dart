import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'application.dart';
import 'database/database.dart';
import 'services/backend.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final backend = BackendService();
  final database = await Database.openDatabaseOnIsolate();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.grey[50],
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  await Future.wait([
    backend.connect(),
  ]);

  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => database),
      Provider(create: (_) => backend),
    ],
    child: const Application(),
  ));
}
