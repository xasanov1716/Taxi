import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/data/models/request_model/request_model.dart';
import 'package:taxi_app/data/models/universal_data.dart';
import 'package:taxi_app/utils/constants/constants.dart';

import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';

class RequestRepo {
  Stream<List<RequestModel>> getClientRequest() =>
      FirebaseFirestore.instance.collection(FirebaseCollections.requestClient).snapshots().map(
            (event1) => event1.docs.map((doc) => RequestModel.fromJson(doc.data())).toList(),
          );

  Stream<List<RequestModel>> getClientRequestId() => FirebaseFirestore.instance
      .collection(FirebaseCollections.requestClient)
      .where("user_id", isEqualTo: StorageRepository.getString(StorageKeys.userId))
      .snapshots()
      .map(
        (event1) => event1.docs.map((doc) => RequestModel.fromJson(doc.data())).toList(),
      );

  Stream<List<RequestModel>> getClientFromId({required int fromId, required int toId}) =>
      FirebaseFirestore.instance
          .collection(FirebaseCollections.requestClient)
          .where("from_id", isEqualTo: fromId)
          .where("to_id", isEqualTo: toId)
          .snapshots()
          .map(
            (event1) => event1.docs.map((doc) => RequestModel.fromJson(doc.data())).toList(),
          );

  Future<UniversalData> addRequestClient({required RequestModel requestModelClient}) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseCollections.requestClient)
          .add(requestModelClient.toJson());
      return UniversalData(data: 'Request added for client');
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> updateRequestClient({required RequestModel requestModelClient}) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseCollections.requestClient)
          .doc(requestModelClient.userId)
          .update(requestModelClient.toJson());

      return UniversalData(data: "Request updated for client");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> deleteRequestClient({required String userId}) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseCollections.requestClient)
          .doc(userId)
          .delete();

      return UniversalData(data: 'Request deleted from client');
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Stream<List<RequestModel>> getDriverRequest() =>
      FirebaseFirestore.instance.collection(FirebaseCollections.requestDriver).snapshots().map(
            (event1) => event1.docs.map((doc) => RequestModel.fromJson(doc.data())).toList(),
          );

  Stream<List<RequestModel>> getDriverRequestId() => FirebaseFirestore.instance
      .collection(FirebaseCollections.requestDriver)
      .where("user_id", isEqualTo: StorageRepository.getString(StorageKeys.userId))
      .snapshots()
      .map(
        (event1) => event1.docs.map((doc) => RequestModel.fromJson(doc.data())).toList(),
      );

  Stream<List<RequestModel>> getDriverFromId({required int fromId, required int toId}) =>
      FirebaseFirestore.instance
          .collection(FirebaseCollections.requestDriver)
          .where("from_id", isEqualTo: fromId)
          .where("to_id", isEqualTo: toId)
          .snapshots()
          .map(
            (event1) => event1.docs.map((doc) => RequestModel.fromJson(doc.data())).toList(),
          );

  Future<UniversalData> addRequestDriver({required RequestModel requestModelDriver}) async {
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

  Future<UniversalData> updateRequestDriver({required RequestModel requestModelDriver}) async {
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
