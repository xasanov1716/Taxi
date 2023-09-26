part of 'driver_bloc.dart';

class DriverState extends Equatable {
  final List<DriverModel> drivers;
  List<DriverModel> driversById;

  final FormStatus status;

  DriverState(
      {required this.drivers, required this.status, required this.driversById});

  DriverState copyWith({
    FormStatus? status,
    List<DriverModel>? drivers,
    List<DriverModel>? driversById,
  }) {
    return DriverState(
      status: status ?? this.status,
      driversById: driversById ?? this.driversById,
      drivers: drivers ?? this.drivers,
    );
  }

  @override
  List<Object?> get props => [driversById, status];
}
