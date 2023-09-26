import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:taxi_app/data/models/address/address_model.dart';
import 'package:taxi_app/data/models/status/form_status.dart';

import '../../../data/repositories/firebase_repositories/address_repos.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRepo addressRepo;
  AddressBloc({required this.addressRepo})
      : super(AddressState(
            addressModel: AddressModel, status: FormStatus.pure, address: [])) {
    on<AddAddressEvent>(addAddress);
  }

  Future addAddress(
      AddAddressEvent event, Emitter<AddressState> emitter) async {
    emit(state.copyWhith(status: FormStatus.loading));
    await addressRepo.addAddress(addressModel: event.addressModel);

    emit(state.copyWhith(status: FormStatus.success));
  }
}
