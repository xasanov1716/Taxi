import 'package:easy_localization/easy_localization.dart';

String formatDateTime(DateTime dateTime) {
  var formatter = DateFormat('MMM d, y');
  return formatter.format(dateTime);
}


