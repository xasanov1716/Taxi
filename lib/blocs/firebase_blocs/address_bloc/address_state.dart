part of 'address_bloc.dart';

class AddressState extends Equatable {
  final List<AddressModel> address;
  final AddressModel addressModel;
  final FormStatus status;

  const AddressState(
      {required this.addressModel,
      required this.status,
      required this.address});

  List<Object?> get props => [address, addressModel, status];
  AddressState copyWhith({
    AddressModel? addressModel,
    FormStatus? status,
    List<AddressModel>? address,
  }) {
    return AddressState(
      addressModel: addressModel ?? this.addressModel,
      status: status ?? this.status,
      address: address ?? this.address,
    );
  }
}
