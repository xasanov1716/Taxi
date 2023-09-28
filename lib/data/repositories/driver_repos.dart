import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/models/driver/driver_model.dart';
import 'package:taxi_app/data/models/universal_data.dart';
import 'package:taxi_app/utils/constants/constants.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';

class DriverRepo {
  Future<UniversalData> addDriver({required DriverModel driverModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseCollections.drivers)
          .doc(driverModel.driverId)
          .set(driverModel.toJson());

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
          .collection(FirebaseCollections.drivers)
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
          .collection(FirebaseCollections.drivers)
          .doc(driverId)
          .delete();

      return UniversalData(data: "Driver deleted!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Stream<DriverModel?> getDriverById() {
    return FirebaseFirestore.instance
        .collection(FirebaseCollections.drivers)
        .doc(StorageRepository.getString(StorageKeys.userId))
        .snapshots()
        .map((documentSnapshot) {
      if (documentSnapshot.exists) {
        return DriverModel.fromJson(documentSnapshot.data() ?? {});
      } else {
        return null; // Return null if the document doesn't exist
      }
    });
  }
}
