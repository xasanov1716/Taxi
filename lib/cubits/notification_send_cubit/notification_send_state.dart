part of 'notification_send_cubit.dart';

@immutable
abstract class NotificationSendState {}

class NotificationSendInitial extends NotificationSendState {}

class NotificationSendLoading extends NotificationSendState {}

class NotificationSendError extends NotificationSendState {
  final String errorMessage;

  NotificationSendError(this.errorMessage);
}

class NotificationSendSuccess extends NotificationSendState {}
