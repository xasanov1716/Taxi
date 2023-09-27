import 'package:taxi_app/data/models/notification_model/notification_model.dart';

Map<String, List<NotificationModel>> groupNotificationsByDate(
    List<NotificationModel> notifications) {
  final Map<String, List<NotificationModel>> groupedNotifications = {};

  for (final notification in notifications) {
    final date = DateTime.fromMillisecondsSinceEpoch(notification.timestamp);
    final dateString = _getDateString(date);

    if (!groupedNotifications.containsKey(dateString)) {
      groupedNotifications[dateString] = [];
    }

    groupedNotifications[dateString]!.add(notification);
  }

  return groupedNotifications;
}

String _getDateString(DateTime date) {
  final now = DateTime.now();
  if (date.year == now.year && date.month == now.month && date.day == now.day) {
    return 'Today';
  } else if (date.year == now.year && date.month == now.month && date.day == now.day - 1) {
    return 'Yesterday';
  } else {
    return '${date.day}/${date.month}/${date.year}';
  }
}
