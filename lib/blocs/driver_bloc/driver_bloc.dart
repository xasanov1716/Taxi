import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/data/models/db/driver_model.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/data/repositories/driver_repos.dart';

part 'driver_event.dart';

part 'driver_state.dart';

class DriverBloc extends Bloc<DriverEvent, DriverState> {
  final DriverRepo driverRepo;

  DriverBloc({required this.driverRepo})
      : super(DriverState(
            drivers: const [],
            status: FormStatus.pure,
            driversById: const [])) {
    on<AddDriverEvent>(addDriver);
    on<UpdateDriverEvent>(updateDriver);
    on<DeleteDriverEvent>(deleteDriver);
  }

  Future<void> addDriver(
      AddDriverEvent event, Emitter<DriverState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));

    await driverRepo.addDriver(driverModel: event.driverModel);

    emit(state.copyWith(status: FormStatus.success));
  }

  Future<void> updateDriver(
      UpdateDriverEvent event, Emitter<DriverState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));

    await driverRepo.updateDriver(driverModel: event.driverModel);

    emit(state.copyWith(status: FormStatus.success));
  }

  Future<void> deleteDriver(
      DeleteDriverEvent event, Emitter<DriverState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));

    await driverRepo.deleteDriver(driverId: event.driverId);

    emit(state.copyWith(status: FormStatus.success));
  }

}
