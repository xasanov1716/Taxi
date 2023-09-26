import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/data/models/address_model/adders_model.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/data/repositories/firebase_repositories/address_repos.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRepo addressRepo;
  AddressBloc({required this.addressRepo})
      : super(AddressState(
            addressModel: AddressModel(
                addressText: '', addressId: '', longitude: 0.0, latitude: 0.0),
            status: FormStatus.pure,
            address: const [])) {
    on<AddAddressEvent>(addAddress);
    on<UpdateAddressEvent>(updateAddress);
  }

  Future<void> addAddress(
      AddAddressEvent event, Emitter<AddressState> emitter) async {
    emit(state.copyWhith(status: FormStatus.loading));

    await addressRepo.addAddress(addressModel: event.addressModel);

    emit(state.copyWhith(status: FormStatus.success));
  }

  Future<void> updateAddress(
      UpdateAddressEvent event, Emitter<AddressState> emitter) async {
    emit(state.copyWhith(status: FormStatus.loading));

    await addressRepo.updateAddress(addressModel: event.addressModel);

    emit(state.copyWhith(status: FormStatus.success));
  }
  Future<void> deleteAddress(
      DeleteAddressEvent event, Emitter<AddressState> emitter) async {
    emit(state.copyWhith(status: FormStatus.loading));

    await addressRepo.deleteAddress(addressId: event.addressId);

    emit(state.copyWhith(status: FormStatus.success));
  }
}
