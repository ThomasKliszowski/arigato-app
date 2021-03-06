import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application.dart';
import 'services/backend.dart';

Future<void> main() async {
  final backend = BackendService();

  await Future.wait([
    backend.connect(),
  ]);

  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => backend),
    ],
    child: const Application(),
  ));
}
