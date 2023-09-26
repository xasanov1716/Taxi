import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_app/data/models/universal_data.dart';
import 'package:taxi_app/data/models/user/user_model.dart';
import 'package:taxi_app/utils/constants/constants.dart';

class UserRepo {
  Future<UniversalData> addUser({required UserModel userModel}) async {
    try {
      DocumentReference newProduct = await FirebaseFirestore.instance
          .collection(FirebaseCollections.users)
          .add(userModel.toJson());

      await FirebaseFirestore.instance
          .collection(FirebaseCollections.users)
          .doc(newProduct.id)
          .update({
        "userId": newProduct.id,
      });

      return UniversalData(data: "User added!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> updateUser({required UserModel userModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseCollections.users)
          .doc(userModel.userId)
          .update(userModel.toJson());

      return UniversalData(data: "User updated!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> deleteUser({required String userId}) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseCollections.users)
          .doc(userId)
          .delete();

      return UniversalData(data: "User deleted!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }
}
