import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/utils/constants/constants.dart';

part 'security_state.dart';

class SecurityCubit extends Cubit<SecurityState> {
  SecurityCubit()
      : super(const SecurityState(securityNames: [], securityValues: [])){
    saveSecurityValues(securityKeys, securityValues);
    readSecurityValues(securityKeys);
  }

  Future<void> saveSecurityValues(
      List<String> securityKeys, List<bool> securityValues) async {
    final prefs = await SharedPreferences.getInstance();

    for (int i = 0; i < securityKeys.length; i++) {
      final key = securityKeys[i];
      final value = securityValues[i];

      if (!prefs.containsKey(key)) {
        await StorageRepository.putBool(key, value);
      }
    }
  }

  Future<void> readSecurityValues(List<String> securityKeys) async {
    final List<bool> securityValues = [];
    for (int i = 0; i < securityKeys.length; i++) {
      final value = StorageRepository.getBool(securityKeys[i]) ?? false;
      securityValues.add(value);
    }
    emit(state.copyWith(
        securityValues: securityValues, securityNames: securityKeys));
  }

  Future<void> updateSecurityValues(
      String securityKey, bool securityValue, List<String> keys) async {
    StorageRepository.putBool(securityKey, securityValue);
    await readSecurityValues(keys);
  }
}
