import 'package:taxi_app/data/models/universal_data.dart';
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
}
