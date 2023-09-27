import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_app/data/models/address_model/adders_model.dart';
import 'package:taxi_app/data/models/universal_data.dart';
import 'package:taxi_app/utils/constants/constants.dart';

class AddressRepo {
  final FirebaseFirestore base=FirebaseFirestore.instance;
  Future<UniversalData> addAddress({required AddressModel addressModel}) async {
    try {
      DocumentReference newAddress = await base
          .collection(FirebaseCollections.addresses)
          .add(addressModel.toJson());

      await base
          .collection(FirebaseCollections.addresses)
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
      await base
          .collection(FirebaseCollections.addresses)
          .doc(addressModel.addressId)
          .update(addressModel.toJson());

      return UniversalData(data: "Address updated!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> deleteAddress({required String addressId}) async {
    try {
      await base
          .collection(FirebaseCollections.addresses)
          .doc(addressId)
          .delete();

      return UniversalData(data: "Address deleted!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Stream<List<AddressModel>> getAddresses() =>
      FirebaseFirestore.instance.collection(FirebaseCollections.addresses).snapshots().map(
            (event1) => event1.docs
            .map((doc) => AddressModel.fromJson(doc.data()))
            .toList(),
      );


}
