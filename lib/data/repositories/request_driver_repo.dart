import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:taxi_app/data/models/request_model/request_model.dart';
import 'package:taxi_app/data/models/universal_data.dart';
import 'package:taxi_app/utils/constants/constants.dart';

class RequestDriverRepo {
  Stream<List<RequestModel>> getDriverRequest() => FirebaseFirestore.instance
      .collection(FirebaseCollections.requestDriver)
      .snapshots()
      .map(
        (event1) => event1.docs
            .map((doc) => RequestModel.fromJson(doc.data()))
            .toList(),
      );

  Future<UniversalData> addRequestDriver(
      {required RequestModel requestModelDriver}) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseCollections.requestDriver)
          .add(requestModelDriver.toJson());
      debugPrint("RequestAdd");

      return UniversalData(data: 'Request added for driver');
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> updateRequestDriver(
      {required RequestModel requestModelDriver}) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseCollections.requestDriver)
          .doc(requestModelDriver.userId)
          .update(requestModelDriver.toJson());

      return UniversalData(data: "Request updated!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> deleteRequestDriver({required String userId}) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseCollections.requestDriver)
          .doc(userId)
          .delete();

      return UniversalData(data: 'Request deleted from driver');
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }
}
