import 'package:intl/intl.dart';

extension DoubleExtension on double {
  /// Remove traling zeros
  String normalize() {
    final formatter = NumberFormat()..minimumFractionDigits = 0;
    return formatter.format(this);
  }
}
