import 'package:easy_localization/easy_localization.dart';

String formatDateTime(DateTime dateTime) {
  var formatter = DateFormat('MMM d, y');
  return formatter.format(dateTime);
}


String formatSeconds(int seconds) {
  int minutes = seconds ~/ 60;
  int remainingSeconds = seconds % 60;
  String formattedMinutes = minutes.toString().padLeft(2, '0');
  String formattedSeconds = remainingSeconds.toString().padLeft(2, '0');
  return '$formattedMinutes:$formattedSeconds';
}