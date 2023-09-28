import 'package:intl/intl.dart';

String formatTimestamp(int timestamp) {
  // Create a DateTime object from the timestamp (milliseconds since epoch)
  final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

  // Format the DateTime as a string with custom formatting
  final formattedDate = DateFormat.yMMMMd().format(dateTime);

  // Append "year" to the formatted date
  final fullFormattedDate = '$formattedDate year';

  return fullFormattedDate;
}
