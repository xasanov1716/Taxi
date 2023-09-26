import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_app/data/models/address_model/adders_model.dart';
import 'package:taxi_app/data/models/universal_data.dart';

class AddressModelService {
  final String addressCollection = 'address';
  final FirebaseFirestore base=FirebaseFirestore.instance;
  Future<UniversalData> addAddress({required AddressModel addressModel}) async {
    try {
      DocumentReference newAddress = await base
          .collection(addressCollection)
          .add(addressModel.toJson());

      await base
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
      await base
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

  Future<UniversalData> deleteAddress({required String addressId}) async {
    try {
      await base
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


  Stream<List<AddressModel>> getAddresses() async* {
    yield* base.collection(addressCollection).snapshots().map(
          (querySnapshot) => querySnapshot.docs
          .map((doc) => AddressModel.fromJson(doc.data()))
          .toList(),
    );
  }

  Stream<List<AddressModel>> getAddressById({required String addressId}) async* {
    yield* base
        .collection(addressCollection)
        .where("addressId", isEqualTo: addressId)
        .snapshots()
        .map(
          (querySnapshot) => querySnapshot.docs
          .map((doc) => AddressModel.fromJson(doc.data()))
          .toList(),
    );
  }
}
