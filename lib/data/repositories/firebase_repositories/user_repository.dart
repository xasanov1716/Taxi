import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_app/data/models/universal_data.dart';
import 'package:taxi_app/data/models/user/user_model.dart';
import 'package:taxi_app/services/firebase/user_model_service.dart';

class UserRepo {
  final UserService userService;
  UserRepo({required this.userService});
  Future<UniversalData> addUser({required UserModel userModel}) async =>
      await userService.addUser(userModel: userModel);

  Future<UniversalData> updateUser({required UserModel userModel}) async =>
      await userService.updateUser(userModel: userModel);

  Future<UniversalData> deleteUser({required String userId}) async =>
      await userService.deleteUser(userId: userId);


  Stream<List<UserModel>> getUsers() async* {
    yield* FirebaseFirestore.instance
        .collection(usersCollection)
        .snapshots()
        .map(
          (querySnapshot) => querySnapshot.docs
          .map((doc) => UserModel.fromJson(doc.data()))
          .toList(),
    );
  }

  Stream<List<UserModel>> getUsersById(
      {required String userId}) async* {
    yield* FirebaseFirestore.instance
        .collection(usersCollection)
        .where("orderId", isEqualTo: userId)
        .snapshots()
        .map(
          (querySnapshot) => querySnapshot.docs
          .map((doc) => UserModel.fromJson(doc.data()))
          .toList(),
    );
  }
}
