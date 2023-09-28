import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_app/data/models/request_model_client/request_model_client.dart';
import 'package:taxi_app/data/models/universal_data.dart';
import 'package:taxi_app/utils/constants/constants.dart';

class RequestClientRepo{

  Stream<List<RequestModelClient>> getClientRequest() =>
      FirebaseFirestore.instance
          .collection(FirebaseCollections.requestClient)
          .snapshots()
          .map(
            (event1) => event1.docs
            .map((doc) => RequestModelClient.fromJson(doc.data()))
            .toList(),
      );

  Future<UniversalData> addRequestClient({required RequestModelClient requestModelClient}) async {
    try {
      DocumentReference newRequestClient = await FirebaseFirestore.instance
          .collection(FirebaseCollections.requestClient)
          .add(requestModelClient.toJson());

      await FirebaseFirestore.instance
          .collection(FirebaseCollections.requestClient)
          .doc(newRequestClient.id)
          .update({
        'userId': newRequestClient.id,
      });

      return UniversalData(data: 'request added for client');
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> updateRequestClient({required RequestModelClient requestModelClient}) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseCollections.requestClient)
          .doc(requestModelClient.userId)
          .update(requestModelClient.toJson());

      return UniversalData(data: "request updated for client");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> deleteRequestDriver({required String userId}) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseCollections.requestClient)
          .doc(userId)
          .delete();

      return UniversalData(data: 'request deleted from client');
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }




}