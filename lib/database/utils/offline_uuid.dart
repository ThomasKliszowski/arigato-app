import 'dart:typed_data';

import 'package:moor/moor.dart';
import 'package:uuid/uuid.dart';

import '../../services/secure_storage.dart';

/// Create a strong random unique ID using the microsecond timestamp,
/// the local terminal id and a random value.
class OfflineUUID {
  static const int idByteSize = 16;
  static const int timestampByteSize = 8;
  static const int terminalByteSize = 8;
  static int _lastTimestamp;

  static Future<String> generate({int terminalID}) async {
    terminalID ??= await SecureStorage.getTerminalId();
    final timestamp = await _encodeTimestamp();
    final terminalId = _encodeTerminalId(terminalID);
    final offlineID = Uint8List.fromList(timestamp + terminalId);
    if (offlineID.lengthInBytes != idByteSize) {
      throw const OfflineUUIDException(
          'Offline id size is different from $idByteSize');
    }

    return Uuid.unparse(offlineID);
  }

  static String encode(Uint8List value) => Uuid.unparse(value);

  static Uint8List decode(String value) =>
      Uint8List.fromList(Uuid.parse(value));

  static Future<Uint8List> _encodeTimestamp() async {
    int timestamp = _newTimestamp();
    while (_lastTimestamp != null && timestamp <= _lastTimestamp) {
      final waitingTime =
          Duration(microseconds: _lastTimestamp - timestamp + 1);
      await Future.delayed(waitingTime);
      timestamp = _newTimestamp();
    }
    _lastTimestamp = timestamp;
    final binaryTimestamp = Uint8List(timestampByteSize)
      ..buffer.asByteData().setInt64(0, timestamp, Endian.big);
    return binaryTimestamp;
  }

  static int _newTimestamp() => DateTime.now().toUtc().microsecondsSinceEpoch;

  static Uint8List _encodeTerminalId(int terminalID) {
    final binaryID = Uint8List(terminalByteSize)
      ..buffer.asByteData().setInt64(0, terminalID, Endian.big);
    if (binaryID.lengthInBytes != terminalByteSize) {
      throw const OfflineUUIDException(
          'Terminal ID size is different from $terminalByteSize bytes');
    }
    return binaryID;
  }
}

class OfflineUUIDException implements Exception {
  const OfflineUUIDException(this.message);

  final String message;
}
