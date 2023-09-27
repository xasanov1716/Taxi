import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_app/data/models/address_model/adders_model.dart';
import 'package:taxi_app/data/models/universal_data.dart';
import 'package:taxi_app/services/firebase/address_model_service.dart';

class AddressRepo {
  final AddressModelService addressModelService;
  AddressRepo({required this.addressModelService});

  Future<UniversalData> addAddress(
          {required AddressModel addressModel}) async =>
      await addressModelService.addAddress(addressModel: addressModel);

  Future<UniversalData> updateAddress(
          {required AddressModel addressModel}) async =>
      await addressModelService.addAddress(addressModel: addressModel);

  Future<UniversalData> deleteAddress({required String addressId}) async =>
      await addressModelService.deleteAddress(addressId: addressId);

  Stream<List<AddressModel>> getAddresses() async* {
    yield* FirebaseFirestore.instance
        .collection(addressCollection)
        .snapshots()
        .map(
          (querySnapshot) => querySnapshot.docs
              .map((doc) => AddressModel.fromJson(doc.data()))
              .toList(),
        );
  }

  Stream<List<AddressModel>> getAddressById(
      {required String addressId}) async* {
    yield* FirebaseFirestore.instance
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
