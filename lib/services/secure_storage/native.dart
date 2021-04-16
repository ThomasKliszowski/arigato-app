import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _storage = FlutterSecureStorage();

Future<void> storageWrite({String key, String value}) async {
  return _storage.write(key: key, value: value);
}

Future<String> storageRead({String key}) async {
  return _storage.read(key: key);
}
