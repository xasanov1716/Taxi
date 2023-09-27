part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  final List<String> notificationNames;
  final List<bool> notificationValues;

  const NotificationState({
    required this.notificationNames,
    required this.notificationValues,
  });

  NotificationState copyWith({
    List<String>? notificationNames,
    List<bool>? notificationValues,
  }) {
    return NotificationState(
      notificationNames: notificationNames ?? this.notificationNames,
      notificationValues: notificationValues ?? this.notificationValues,
    );
  }

  @override
  List<Object?> get props => [
        notificationNames,
        notificationValues,
      ];
}
