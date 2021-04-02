import 'package:moor/moor.dart';

class DateTimeConverter extends TypeConverter<DateTime, int> {
  const DateTimeConverter();
  @override
  DateTime mapToDart(int fromDb) {
    if (fromDb == null) {
      return null;
    }
    return DateTime.fromMicrosecondsSinceEpoch(fromDb);
  }

  @override
  int mapToSql(DateTime value) {
    return value?.microsecondsSinceEpoch;
  }

  static int now() => DateTime.now().toUtc().microsecondsSinceEpoch;
}
