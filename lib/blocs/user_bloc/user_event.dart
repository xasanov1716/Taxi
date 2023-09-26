part of 'user_bloc.dart';
@immutable
abstract class UserEvent {}
class GetUserEvent extends UserEvent{}
class AddUserEvent extends UserEvent{
  final UserModel userModel;
  AddUserEvent({required this.userModel});
}
class UpdateUserEvent extends UserEvent{
  final UserModel userModel;
  UpdateUserEvent({required this.userModel});
}
class DeleteUserEvent extends UserEvent{
  final String userId;
  DeleteUserEvent({required this.userId});
}