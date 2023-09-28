import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:taxi_app/data/models/notification_model/notification_model.dart';
import 'package:taxi_app/services/api_service.dart';

part 'notification_send_state.dart';

class NotificationSendCubit extends Cubit<NotificationSendState> {
  NotificationSendCubit() : super(NotificationSendInitial());

  sendNotification(NotificationModel notification) async {
    emit(NotificationSendLoading());
    final response = await GetIt.I<ApiService>().sendNotification(notification: notification);
    (response.isSuccess)
        ? emit(NotificationSendSuccess())
        : emit(NotificationSendError(response.errorMessage!));
  }
}
