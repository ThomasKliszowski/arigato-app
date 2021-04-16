import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'application.dart';
import 'database/executor/shared.dart';
import 'services/backend.dart';
import 'services/terminal.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDatabase();
  final database = await openDatabase();
  final backend = BackendService();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.grey[50],
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  await TerminalService.ensureTerminalCreated(backend);
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
