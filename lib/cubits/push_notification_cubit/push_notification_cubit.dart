import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taxi_app/data/models/notification_model/notification_model.dart';
import 'package:taxi_app/services/api_service.dart';

part 'push_notification_state.dart';

class PushNotificationCubit extends Cubit<PushNotificationState> {
  PushNotificationCubit({required ApiService apiService})
      : _apiService = apiService,
        super(const PushNotificationState());

  final ApiService _apiService;

  Future<void> getPushNotification(NotificationModel notificationModel) async {
    emit(state.copyWith(state: StateNotification.loading));
    final data = await _apiService.sendNotification(notification:notificationModel);
    if (data.isSuccess){
      emit(state.copyWith(state: StateNotification.success));
    }else{
      emit(state.copyWith(state: StateNotification.failure));
    }

  }


}
