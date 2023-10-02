import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taxi_app/data/models/request_model_driver/request_model_driver.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/data/models/universal_data.dart';
import 'package:taxi_app/data/repositories/request_driver_repo.dart';

part 'driver_request_event.dart';

part 'driver_request_state.dart';

class DriverRequestBloc extends Bloc<DriverRequestEvent, DriverRequestState> {
  DriverRequestBloc({required RequestDriverRepo requestDriverRepo})
      : _requestDriverRepo = requestDriverRepo,
        super(const DriverRequestState()) {
    on<AddDriverRequest>(_addDriverRequest);
    on<UpdateDriverRequest>(_updateDriverRequest);
    on<DeleteDriverRequest>(_deleteDriverRequest);
  }

  Future<void> _addDriverRequest(
      AddDriverRequest event, Emitter<DriverRequestState> emit) async {
    emit(state.copyWith(statusRequest: FormStatus.loading));
    UniversalData data = await _requestDriverRepo.addRequestDriver(
        requestModelDriver: event.requestModelDriver);
    debugPrint(event.requestModelDriver.toString());
    if (data.error.isEmpty) {
      emit(state.copyWith(
        statusRequest: FormStatus.success,
      ));
    } else {
      emit(state.copyWith(
        statusRequest: FormStatus.failure,
        errorText: "Request not added"
      ));
    }
  }

  Future<void> _updateDriverRequest(
      UpdateDriverRequest event, Emitter<DriverRequestState> emit) async {
    emit(state.copyWith(statusRequest: FormStatus.loading));
    UniversalData data = await _requestDriverRepo.updateRequestDriver(
        requestModelDriver: event.requestModelDriver);
    if (data.error.isEmpty) {
      emit(state.copyWith(
        statusRequest: FormStatus.success
      ));
    } else {
      emit(state.copyWith(
        statusRequest: FormStatus.failure,
          errorText: "Request not update"
      ));
    }
  }

  Future<void> _deleteDriverRequest(
      DeleteDriverRequest event, Emitter<DriverRequestState> emit) async {
    emit(state.copyWith(statusRequest: FormStatus.loading));
    UniversalData data = await _requestDriverRepo.deleteRequestDriver(userId: event.userId);
    if (data.error.isEmpty) {
      emit(state.copyWith(
        statusRequest: FormStatus.success,
      ));
    } else {
      emit(state.copyWith(
        statusRequest: FormStatus.failure,
          errorText: "Request not delete"
      ));
    }
  }


  final RequestDriverRepo _requestDriverRepo;
}
