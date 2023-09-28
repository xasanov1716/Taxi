part of 'notification_bloc.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationUploadLoading extends NotificationState {}

class NotificationUploadError extends NotificationState {
  final String errorMessage;

  NotificationUploadError(this.errorMessage);
}

class NotificationUploadSuccess extends NotificationState {
  final List<NotificationModel> notifications;

  NotificationUploadSuccess(this.notifications);
}
