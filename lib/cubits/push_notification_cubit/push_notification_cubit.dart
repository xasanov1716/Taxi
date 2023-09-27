import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taxi_app/data/models/notification_model/notification_model.dart';

part 'push_notification_state.dart';

class PushNotificationCubit extends Cubit<PushNotificationState> {
  PushNotificationCubit() : super( PushNotificationState());


  Future<void> getPushNotification()async{
    emit(state.copyWith(state: StateNotification.loading));


  }



}
