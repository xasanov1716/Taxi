import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_app/data/models/db/driver_model.dart';
import 'package:taxi_app/data/models/universal_data.dart';
const String driverCollection = 'drivers';

class DriverModelService {

  Future<UniversalData> addDriver({required DriverModel driverModel}) async {
    try {
      DocumentReference newDriver = await FirebaseFirestore.instance
          .collection(driverCollection)
          .add(driverModel.toJson());

      await FirebaseFirestore.instance
          .collection(driverCollection)
          .doc(newDriver.id)
          .update({'driverId': newDriver.id});

      return UniversalData(data: 'Driver Added!');
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> updateDriver({required DriverModel driverModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection(driverCollection)
          .doc(driverModel.driverId)
          .update(driverModel.toJson());

      return UniversalData(data: "Driver updated!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> deleteDriver({required String driverId}) async {
    try {
      await FirebaseFirestore.instance
          .collection(driverCollection)
          .doc(driverId)
          .delete();

      return UniversalData(data: "Driver deleted!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }
}
