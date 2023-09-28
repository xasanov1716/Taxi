part of 'user_bloc.dart';

class UserState extends Equatable {
  final String statusText;
  final UserModel userModel;
  final FormStatus status;

  const UserState({
    required this.statusText,
    required this.userModel,
    required this.status,
  });
  
  UserState copyWith({
    String? statusText,
    UserModel? userModel,
    FormStatus? status,
  }) {
    return UserState(
        statusText: statusText ?? this.statusText,
        userModel: userModel ?? this.userModel,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [statusText, status, userModel];
}
