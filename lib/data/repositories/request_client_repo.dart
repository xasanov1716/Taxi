import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_app/data/models/request_model_client/request_model_client.dart';
import 'package:taxi_app/data/models/universal_data.dart';
import 'package:taxi_app/utils/constants/constants.dart';

class RequestClientRepo {
  Stream<List<RequestModelClient>> getClientRequest() =>
      FirebaseFirestore.instance
          .collection(FirebaseCollections.requestClient)
          .snapshots()
          .map(
            (requestClient) => requestClient.docs
                .map((doc) => RequestModelClient.fromJson(doc.data()))
                .toList(),
          );

  Stream<RequestModelClient?> getClientRequestById({required String userId}) =>
      FirebaseFirestore.instance
          .collection(FirebaseCollections.requestClient)
          .doc(userId)
          .snapshots()
          .map((requestClientById) {
        if (requestClientById.exists) {
          return RequestModelClient.fromJson(requestClientById.data() ?? {});
        } else {
          return null;
        }
      });

  Future<UniversalData> addRequestClient(
      {required RequestModelClient requestModelClient}) async {
    try {
      DocumentReference newRequestClient = await FirebaseFirestore.instance
          .collection(FirebaseCollections.requestClient)
          .add(requestModelClient.toJson());

      await FirebaseFirestore.instance
          .collection(FirebaseCollections.requestClient)
          .doc(newRequestClient.id)
          .update({
        'user_id': newRequestClient.id,
      });

      return UniversalData(data: 'Request added for client');
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> updateRequestClient(
      {required RequestModelClient requestModelClient}) async {
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
}
