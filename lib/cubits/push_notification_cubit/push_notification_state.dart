part of 'push_notification_cubit.dart';

class PushNotificationState extends Equatable {
  const PushNotificationState({
    // this.notificationModel = NotificationModel.initial(),
      this.state = StateNotification.initial});

  final StateNotification state;
  // final NotificationModel notificationModel;

  PushNotificationState copyWith({
    StateNotification? state,
  }) =>
      PushNotificationState(
          // notificationModel: notificationModel,
          state: state ?? this.state);

  @override
  List<Object?> get props => [state];
}

enum StateNotification { initial, loading, success, failure }
