part of 'driver_bloc.dart';

@immutable
abstract class DriverEvent {}

class GetDriverEvent extends DriverEvent {}

class AddDriverEvent extends DriverEvent {
}

class UpdateDriverEvent extends DriverEvent {

}

class DeleteDriverEvent extends DriverEvent {
  final String driverId;

  DeleteDriverEvent({required this.driverId});
}

class GetDriverByIdEvent extends DriverEvent {
  final String driverId;

  GetDriverByIdEvent({required this.driverId});
}
