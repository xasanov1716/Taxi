import 'package:get_it/get_it.dart';
import 'package:taxi_app/data/local/local_database/database_helper.dart';

class ServiceLocator {
  static final GetIt _locator = GetIt.instance;

  static void setup() {
    _locator.registerLazySingleton(() => DBHelper.instance);
  }

  // static T get<T>() => _locator.get<T>();
}
