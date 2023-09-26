part of 'driver_bloc.dart';

@immutable
abstract class DriverEvent {}

class GetDriverEvent extends DriverEvent {}

class AddDriverEvent extends DriverEvent {
  final DriverModel driverModel;

  AddDriverEvent({required this.driverModel});
}

class UpdateDriverEvent extends DriverEvent {
  final DriverModel driverModel;

  UpdateDriverEvent({required this.driverModel});
}

class DeleteDriverEvent extends DriverEvent {
  final String driverId;

  DeleteDriverEvent({required this.driverId});
}

class GetDriverByIdEvent extends DriverEvent {
  final String driverId;

  GetDriverByIdEvent({required this.driverId});
}
