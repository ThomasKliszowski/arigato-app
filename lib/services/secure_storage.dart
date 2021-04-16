import 'secure_storage/shared.dart';

class SecureStorage {
  static const _kTerminalIdKey = 'ARIGATO_TERMINAL_ID';
  static const _kTerminalTokenKey = 'ARIGATO_TERMINAL_TOKEN';

  static Future<void> setTerminalId(int value) =>
      storageWrite(key: _kTerminalIdKey, value: value.toString());
  static Future<int> getTerminalId() async {
    final value = await storageRead(key: _kTerminalIdKey);
    return value != null ? int.parse(value) : null;
  }

  static Future<void> setTerminalToken(String value) =>
      storageWrite(key: _kTerminalTokenKey, value: value);
  static Future<String> getTerminalToken() =>
      storageRead(key: _kTerminalTokenKey);
}
