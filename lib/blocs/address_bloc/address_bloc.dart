import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/data/models/address_model/address_model.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/data/models/universal_data.dart';
import 'package:taxi_app/data/repositories/address_repos.dart';

part 'address_event.dart';

part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressStates> {
  final AddressRepo addressRepo;

  AddressBloc({required this.addressRepo})
      : super(
          AddressStates(
            addresses: const [],
            addressModel: AddressModel(
              addressText: '',
              addressId: '',
              longitude: 0.0,
              latitude: 0.0,
              apartment: '',
              orientation: '',
              userId: '',
              userType: '',
            ),
            status: FormStatus.pure,
          ),
        ) {
    on<AddAddressEvent>(addAddress);
    on<UpdateAddressEvent>(updateAddress);
    on<DeleteAddressEvent>(deleteAddress);
  }

  Future<void> addAddress(
      AddAddressEvent event, Emitter<AddressStates> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    UniversalData data =
        await addressRepo.addAddress(addressModel: event.addressModel);
    if (data.error.isEmpty) {
      emit(state.copyWith(
        status: FormStatus.success,
      ));
    } else {
      emit(state.copyWith(
        status: FormStatus.failure,
      ));
    }
  }

  Future<void> updateAddress(
      UpdateAddressEvent event, Emitter<AddressStates> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    UniversalData data =
        await addressRepo.updateAddress(addressModel: event.addressModel);
    if (data.error.isEmpty) {
      emit(state.copyWith(
        status: FormStatus.success,
      ));
    } else {
      emit(state.copyWith(
        status: FormStatus.failure,
      ));
    }
  }

  Future<void> deleteAddress(
      DeleteAddressEvent event, Emitter<AddressStates> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    UniversalData data =
        await addressRepo.deleteAddress(addressId: event.addressId);
    if (data.error.isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.success,
        ),
      );
    } else {
      emit(state.copyWith(
        status: FormStatus.failure,
      ));
    }
  }
}
