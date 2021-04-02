import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage();
  static const _kTerminalIdKey = 'ARIGATO_TERMINAL_ID';
  static const _kTerminalTokenKey = 'ARIGATO_TERMINAL_TOKEN';

  static Future<void> setTerminalId(int value) =>
      _storage.write(key: _kTerminalIdKey, value: value.toString());
  static Future<int> getTerminalId() async {
    final value = await _storage.read(key: _kTerminalIdKey);
    return value != null ? int.parse(value) : null;
  }

  static Future<void> setTerminalToken(String value) =>
      _storage.write(key: _kTerminalTokenKey, value: value);
  static Future<String> getTerminalToken() =>
      _storage.read(key: _kTerminalTokenKey);
}
