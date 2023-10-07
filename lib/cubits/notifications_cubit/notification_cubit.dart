import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/utils/constants/constants.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit()
      : super(
          const NotificationState(
            notificationNames: [],
            notificationValues: [],
          ),
        ) {
    saveNotificationValues(notificationKeys, notificationValues);
    readNotificationValues(notificationKeys);
  }

  Future<void> saveNotificationValues(List<String> keys, List<bool> values) async {
    final prefs = await SharedPreferences.getInstance();

    for (int i = 0; i < keys.length; i++) {
      final key = keys[i];
      final value = values[i];

      if (!prefs.containsKey(key)) {
        await StorageRepository.putBool(key, value);
      }
    }
  }

  Future<void> readNotificationValues(List<String> keys) async {
    final List<bool> values = [];

    for (int i = 0; i < keys.length; i++) {
      final value = StorageRepository.getBool(keys[i]);
      values.add(value);
    }
    emit(state.copyWith(notificationValues: values, notificationNames: keys));
  }

  Future<void> updateNotificationValues(String key, bool value, List<String> keys) async {
    StorageRepository.putBool(key, value);
    await readNotificationValues(keys);
  }
}
