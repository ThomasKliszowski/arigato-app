import 'dart:html';

Future<void> storageWrite({String key, String value}) async {
  return window.localStorage[key] = value;
}

Future<String> storageRead({String key}) async {
  return window.localStorage[key];
}
