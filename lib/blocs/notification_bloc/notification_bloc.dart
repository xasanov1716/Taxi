import 'package:get_it/get_it.dart';
import 'package:taxi_app/data/local/local_database/database_helper.dart';
import 'package:taxi_app/data/models/notification_model/notification_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'notification_event.dart';

part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<UpdateNotifications>(_updateNotifications);
  }

  _updateNotifications(event, emit) async {
    emit(NotificationUploadLoading());

    try {
      final response = await GetIt.I<DBHelper>().getAllNotifications();
      emit(NotificationUploadSuccess(response));
    } catch (e) {
      emit(NotificationUploadError(e.toString()));
    }
  }
}
