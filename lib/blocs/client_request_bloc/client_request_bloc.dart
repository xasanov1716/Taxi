import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taxi_app/data/models/request_model/request_model.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/data/models/universal_data.dart';
import 'package:taxi_app/data/repositories/request_client_repo.dart';

part 'client_request_event.dart';

part 'client_request_state.dart';

class ClientRequestBloc extends Bloc<ClientRequestEvent, ClientRequestState> {
  ClientRequestBloc({required RequestClientRepo requestClientRepo})
      : _requestClientRepo = requestClientRepo,
        super(const ClientRequestState()) {
    on<AddClientRequest>(_addClientRequest);
    on<UpdateClientRequest>(_updateClientRequest);
    on<DeleteClientRequest>(_deleteClientRequest);
  }

  Future<void> _addClientRequest(
      AddClientRequest event, Emitter<ClientRequestState> emit) async {
    emit(state.copyWith(statusRequest: FormStatus.loading));
    UniversalData data = await _requestClientRepo.addRequestClient(
        requestModelClient: event.requestModelClient);
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

  Future<void> _updateClientRequest(
      UpdateClientRequest event, Emitter<ClientRequestState> emit) async {
    emit(state.copyWith(statusRequest: FormStatus.loading));
    UniversalData data = await _requestClientRepo.updateRequestClient(
        requestModelClient: event.requestModelClient);
    if (data.error.isEmpty) {
      emit(state.copyWith(
        statusRequest: FormStatus.success,
      ));
    } else {
      emit(state.copyWith(
        statusRequest: FormStatus.failure,
          errorText: "Request not update"
      ));
    }
  }

  Future<void> _deleteClientRequest(
      DeleteClientRequest event, Emitter<ClientRequestState> emit) async {
    emit(state.copyWith(statusRequest: FormStatus.loading));
    UniversalData data = await _requestClientRepo.deleteRequestClient(userId: event.userId);
    if (data.error.isEmpty) {
      emit(state.copyWith(
        statusRequest: FormStatus.success,
      ));
    } else {
      emit(state.copyWith(
        statusRequest: FormStatus.failure,
      ));
    }
  }


  final RequestClientRepo _requestClientRepo;
}
