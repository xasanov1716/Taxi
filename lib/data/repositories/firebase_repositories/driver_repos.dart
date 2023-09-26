import 'package:taxi_app/data/models/address/address_model.dart';
import 'package:taxi_app/data/models/universal_data.dart';
import 'package:taxi_app/services/firebase/address_model_service.dart';
import 'package:taxi_app/services/firebase/driver_model_service.dart';

class DriverRepo {
  final DriverModelService driverModelService;
  DriverRepo({required this.driverModelService});

  Future<UniversalData> addDriver(
      {required DriverModel driverModel}) async =>
      await driverModelService.addDriver(driverModel: driverModel);

  Future<UniversalData> updateDriver(
      {required DriverModel driverModel}) async =>
      await driverModelService.updateDriver(driverModel: driverModel);


  Future<UniversalData> deleteDriver(
      {required String driverId}) async =>
      await driverModelService.deleteDriver( driverId: driverId);








}
