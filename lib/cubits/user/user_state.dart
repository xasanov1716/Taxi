
import 'package:taxi_app/data/models/user/user_model.dart';

class UserState {
  final String errorText;
  final UserModel userModel;

  UserState({
    required this.userModel,
    required this.errorText,
  });

  UserState copyWith({
    String? errorText,
    UserModel? userModel,
  }) =>
      UserState(
        userModel: userModel ?? this.userModel,
        errorText: errorText ?? this.errorText,
      );
}
