part of 'get_driver_informations_cubit.dart';

abstract class GetDriverInformationsState {}

class GetDriverInfoLoading extends GetDriverInformationsState {}

class GetDriverInfoSuccess extends GetDriverInformationsState {
  final DriverModel driver;

  GetDriverInfoSuccess(this.driver);
}

class GetDriverInfoError extends GetDriverInformationsState {
  final String errorMessage;

  GetDriverInfoError(this.errorMessage);
}
