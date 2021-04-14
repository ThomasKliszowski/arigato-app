import 'package:flutter/material.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:provider/provider.dart';

import '../services/backend/terminal.dart';
import '../services/secureStorage.dart';
import 'backend/library.dart';

class BackendService {
  static const kWssEndpoint = 'wss://api.arigatoapp.com/app/websocket';
  static const kHttpsEndpoint = 'https://api.arigatoapp.com/v1';
  // static const kWssEndpoint = 'ws://localhost:4000/app/websocket';
  // static const kHttpsEndpoint = 'http://localhost:4000/v1';
  PhoenixSocket _socket;

  static BackendService of(BuildContext context) =>
      Provider.of<BackendService>(context, listen: false);

  final library = BackendLibrary();
  final terminal = BackendTerminal();

  Future<void> connect() async {
    close();

    final terminalToken = await SecureStorage.getTerminalToken();
    _socket = PhoenixSocket(kWssEndpoint,
        socketOptions: PhoenixSocketOptions(
          dynamicParams: () async => {
            'accept-language': 'fr-FR',
            'terminal-token': terminalToken,
          },
        ));

    await _socket.connect();
    await library.join(_socket);
  }

  void close() {
    _socket?.close();
    _socket?.dispose();
  }
}
