import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_app/data/models/universal_data.dart';


class AddressModelService {
  final String addressCollection = 'address';
   Future<UniversalData> addAddress(
      {required AddressModel addressModel}) async {
    try {
      DocumentReference newAddress = await FirebaseFirestore.instance
          .collection(addressCollection)
          .add(addressModel.toJson());

      await FirebaseFirestore.instance
          .collection(addressCollection)
          .doc(newAddress.id)
          .update({
        "addressId": newAddress.id,
      });

      return UniversalData(data: "Address added!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

   Future<UniversalData> updateAddress(
      {required AddressModel addressModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection(addressCollection)
          .doc(addressModel.addressId)
          .update(addressModel.toJson());

      return UniversalData(data: "Address updated!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

   Future<UniversalData> deleteAddress(
      {required String addressId}) async {
    try {
      await FirebaseFirestore.instance
          .collection(addressCollection)
          .doc(addressId)
          .delete();

      return UniversalData(data: "Address deleted!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }
}
