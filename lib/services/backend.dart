import 'package:flutter/material.dart';
import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:provider/provider.dart';

import 'backend/library.dart';

class BackendService {
  static const _kEndpoint = 'wss://api.arigatoapp.com/app/websocket';
  PhoenixSocket _socket;

  static BackendService of(BuildContext context) =>
      Provider.of<BackendService>(context, listen: false);

  final library = BackendLibrary();

  Future<void> connect() async {
    _socket?.close();

    _socket = PhoenixSocket(_kEndpoint,
        socketOptions: PhoenixSocketOptions(
          dynamicParams: () async => {
            'accept-language': 'fr-FR',
          },
        ));

    await _socket.connect();
    await library.join(_socket);
  }

  void close() => _socket?.close();
}
