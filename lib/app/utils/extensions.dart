import 'package:intl/intl.dart';

extension ToDataTime on String {
  DateTime toDateTime() {
    return DateTime.parse(this);
  }
}

extension ToShortDate on String {
  String toShortDate() {
    final format = DateFormat.yMMM().format(toDateTime());
    return format.toString();
  }
}
