import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taxi_app/data/local/search_location/places_db.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/data/models/places/region_model.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/data/models/universal_data.dart';
import 'package:taxi_app/data/repositories/request_repo.dart';
import 'package:taxi_app/utils/constants/constants.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';

import 'package:taxi_app/data/models/request_model/request_model.dart';

part 'request_event.dart';

part 'request_state.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  final RequestRepo _requestRepo;

  RequestBloc({required RequestRepo requestDriverRepo})
      : _requestRepo = requestDriverRepo,
        super(
          const RequestState(
            regionModels: [],
            descriptionText: '',
            priceText: '',
          ),
        ) {
    on<AddRequest>(_addRequest);
    on<UpdateRequest>(_updateRequest);
    on<DeleteRequest>(_deleteRequest);
    on<UpdateCurrentField>(updateRequestField);
    on<InitDBRegions>(initializeRegions);
    on<ClearAll>(clearAllState);
    add(InitDBRegions());
  }

  void initializeRegions(InitDBRegions event, Emitter<RequestState> emit) async {
    List<RegionModel> regionModels =
        (await PlacesDatabase.instance.getAllRegions()).map((e) => e).toList();
    emit(state.copyWith(regionModels: regionModels));
  }

  clearAllState(ClearAll event, Emitter<RequestState> emit) {
    emit(state.copyWith(
      requestModel: const RequestModel.initial(),
      priceText: '',
      errorText: '',
      descriptionText: '',
      statusRequest: FormStatus.pure,
    ));
  }

  Future<void> _addRequest(
    AddRequest event,
    Emitter<RequestState> emit,
  ) async {
    emit(state.copyWith(statusRequest: FormStatus.loading));
    UniversalData data;
    if (StorageRepository.getString(StorageKeys.userRole) == AppConstants.client) {
      data = await _requestRepo.addRequestClient(
        requestModelClient: state.requestModel,
      );
    } else {
      data = await _requestRepo.addRequestDriver(
        requestModelDriver: state.requestModel,
      );
    }
    if (data.error.isEmpty) {
      emit(state.copyWith(
        statusRequest: FormStatus.success,
      ));
    } else {
      emit(state.copyWith(statusRequest: FormStatus.failure, errorText: tr('request_not_added')));
    }
  }

  Future<void> _updateRequest(UpdateRequest event, Emitter<RequestState> emit) async {
    emit(state.copyWith(statusRequest: FormStatus.loading));
    UniversalData data;
    if (StorageRepository.getString(StorageKeys.userRole) == AppConstants.client) {
      data = await _requestRepo.updateRequestClient(
        requestModelClient: state.requestModel,
      );
    } else {
      data = await _requestRepo.updateRequestDriver(
        requestModelDriver: state.requestModel,
      );
    }
    if (data.error.isEmpty) {
      emit(state.copyWith(statusRequest: FormStatus.success));
    } else {
      emit(state.copyWith(statusRequest: FormStatus.failure, errorText:tr('request_not_update')));
    }
  }

  Future<void> _deleteRequest(DeleteRequest event, Emitter<RequestState> emit) async {
    emit(state.copyWith(statusRequest: FormStatus.loading));
    UniversalData data;
    if (StorageRepository.getString(StorageKeys.userRole) == AppConstants.client) {
      data = await _requestRepo.deleteRequestClient(
        userId: event.userId,
      );
    } else {
      data = await _requestRepo.deleteRequestDriver(
        userId: event.userId,
      );
    }
    if (data.error.isEmpty) {
      emit(state.copyWith(
        statusRequest: FormStatus.success,
      ));
    } else {
      emit(state.copyWith(statusRequest: FormStatus.failure, errorText: tr('request_not_delete')));
    }
  }

  void updateRequestField(UpdateCurrentField event, Emitter<RequestState> emit) {
    RequestModel requestModel = state.requestModel;

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
        requestModel = requestModel.copyWith(description: event.value as String?);
        break;
      case RequestField.requestPrice:
        requestModel = requestModel.copyWith(requestPrice: event.value as int?);
        break;
      case RequestField.emptyPlaces:
        requestModel = requestModel.copyWith(passengerCount: event.value as int?);
        break;
      case RequestField.tripTime:
        requestModel = requestModel.copyWith(tripTime: event.value as String?);
        break;
      case RequestField.createdAt:
        requestModel = requestModel.copyWith(createdAt: event.value as String?);
        break;
      case RequestField.creatorName:
        requestModel = requestModel.copyWith(creatorName: event.value as String?);
        break;
    }
    requestModel = requestModel.copyWith(createdAt: DateTime.now().toString().substring(0, 16));
    requestModel = requestModel.copyWith(userId: StorageRepository.getString(StorageKeys.userId));

    debugPrint(requestModel.toString());
    emit(state.copyWith(requestModel: requestModel));
  }
}
