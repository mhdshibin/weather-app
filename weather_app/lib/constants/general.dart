import 'package:intl/intl.dart';

String getWeekdayFromDate(String date) {
  DateTime dT = DateTime.parse(date);
  String weekday = DateFormat.EEEE().format(dT);
  print(weekday);
  return weekday;
}
