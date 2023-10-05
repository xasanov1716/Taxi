part of 'get_client_info_cubit.dart';

abstract class GetClientInfoState {}

class GetClientInfoLoading extends GetClientInfoState {}

class GetClientInfoSuccess extends GetClientInfoState {
  final UserModel user;

  GetClientInfoSuccess(this.user);
}

class GetClientInfoError extends GetClientInfoState {
  final String errorMessage;

  GetClientInfoError(this.errorMessage);
}
