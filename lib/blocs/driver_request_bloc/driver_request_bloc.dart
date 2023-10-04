import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taxi_app/data/local/search_location/places_db.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/models/places/region_model.dart';
import 'package:taxi_app/data/models/request_model_driver/request_model_driver.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/data/models/universal_data.dart';
import 'package:taxi_app/data/repositories/request_driver_repo.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';

part 'driver_request_event.dart';
part 'driver_request_state.dart';

class DriverRequestBloc extends Bloc<DriverRequestEvent, DriverRequestState> {
  final RequestDriverRepo _requestDriverRepo;

  DriverRequestBloc({required RequestDriverRepo requestDriverRepo})
      : _requestDriverRepo = requestDriverRepo,
        super(
          const DriverRequestState(
            regionModels: [],
            descriptionText: '',
            priceText: '',
          ),
        ) {
    on<AddDriverRequest>(_addDriverRequest);
    on<UpdateDriverRequest>(_updateDriverRequest);
    on<DeleteDriverRequest>(_deleteDriverRequest);
    on<UpdateCurrentDriverField>(updateRequestField);
    on<InitDBRegions>(initializeRegions);
    add(InitDBRegions());
  }

  void initializeRegions(
      InitDBRegions event, Emitter<DriverRequestState> emit) async {
    List<RegionModel> regionModels =
        (await PlacesDatabase.instance.getAllRegions()).map((e) => e).toList();
    emit(state.copyWith(regionModels: regionModels));
  }

  clearAllState() {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(
        requestModelDriver: const RequestModelDriver.initial(),
        priceText: '',
        errorText: '',
        descriptionText: '',
        statusRequest: FormStatus.pure));
  }

  Future<void> _addDriverRequest(
      AddDriverRequest event, Emitter<DriverRequestState> emit) async {
    emit(state.copyWith(statusRequest: FormStatus.loading));
    UniversalData data = await _requestDriverRepo.addRequestDriver(
        requestModelDriver: state.requestModelDriver);

    if (data.error.isEmpty) {
      emit(state.copyWith(
        statusRequest: FormStatus.success,
      ));
    } else {
      emit(state.copyWith(
          statusRequest: FormStatus.failure, errorText: "Request not added"));
    }
  }

  Future<void> _updateDriverRequest(
      UpdateDriverRequest event, Emitter<DriverRequestState> emit) async {
    emit(state.copyWith(statusRequest: FormStatus.loading));
    UniversalData data = await _requestDriverRepo.updateRequestDriver(
        requestModelDriver: event.requestModelDriver);
    if (data.error.isEmpty) {
      emit(state.copyWith(statusRequest: FormStatus.success));
    } else {
      emit(state.copyWith(
          statusRequest: FormStatus.failure, errorText: "Request not update"));
    }
  }

  Future<void> _deleteDriverRequest(
      DeleteDriverRequest event, Emitter<DriverRequestState> emit) async {
    emit(state.copyWith(statusRequest: FormStatus.loading));
    UniversalData data =
        await _requestDriverRepo.deleteRequestDriver(userId: event.userId);
    if (data.error.isEmpty) {
      emit(state.copyWith(
        statusRequest: FormStatus.success,
      ));
    } else {
      emit(state.copyWith(
          statusRequest: FormStatus.failure, errorText: "Request not delete"));
    }
  }

  void updateRequestField(
      UpdateCurrentDriverField event, Emitter<DriverRequestState> emit) {
    RequestModelDriver requestModel = state.requestModelDriver;

    switch (event.fieldKey) {
      case RequestField.userId:
        requestModel = requestModel.copyWith(userId: event.value as String?);
        break;
      case RequestField.fromId:
        requestModel = requestModel.copyWith(fromId: event.value as int?);
        break;
      case RequestField.toId:
        requestModel = requestModel.copyWith(toId: event.value as int?);
        break;
      case RequestField.description:
        requestModel =
            requestModel.copyWith(description: event.value as String?);
        break;
      case RequestField.requestPrice:
        requestModel = requestModel.copyWith(requestPrice: event.value as int?);
        break;
      case RequestField.emptyPlaces:
        requestModel = requestModel.copyWith(emptyPlaces: event.value as int?);
        break;
      case RequestField.tripTime:
        requestModel = requestModel.copyWith(tripTime: event.value as String?);
        break;
      case RequestField.createdAt:
        requestModel = requestModel.copyWith(createdAt: event.value as String?);
        break;
    }
    requestModel = requestModel.copyWith(
        createdAt: DateTime.now().toString().substring(0, 16));
    requestModel = requestModel.copyWith(
        userId: StorageRepository.getString(StorageKeys.userId));

    debugPrint(requestModel.toString());
    emit(state.copyWith(requestModelDriver: requestModel));
  }
}
