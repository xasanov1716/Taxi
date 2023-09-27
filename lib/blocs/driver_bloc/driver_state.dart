part of 'driver_bloc.dart';

class DriverState extends Equatable {
  final List<DriverModel> drivers;
  final DriverModel driverModel;
  List<DriverModel> driversById;
  final String statusText;

  final FormStatus status;

  DriverState(
      {required this.drivers,
      required this.statusText,
      required this.driverModel,
      required this.status,
      required this.driversById});

  DriverState copyWith({
    FormStatus? status,
    DriverModel? driverModel,
    String? statusText,
    List<DriverModel>? drivers,
    List<DriverModel>? driversById,
  }) {
    return DriverState(
      status: status ?? this.status,
      driversById: driversById ?? this.driversById,
      drivers: drivers ?? this.drivers,
      statusText: statusText ?? this.statusText,
      driverModel: driverModel ?? this.driverModel,
    );
  }

  @override
  List<Object?> get props => [driversById, status,driverModel,statusText];
}
