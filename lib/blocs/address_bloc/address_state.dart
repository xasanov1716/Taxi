part of 'address_bloc.dart';

class AddressStates extends Equatable {
  final List<AddressModel> addresses;
  final AddressModel addressModel;
  List<AddressModel> address;

  final FormStatus status;
  AddressStates(
      {required this.addresses,
      required this.addressModel,
      required this.status,
      required this.address});

  @override
  List<Object?> get props => [address, addressModel, status];
  AddressStates copyWith({
    AddressModel? addressModel,
    FormStatus? status,
    List<AddressModel>? addresses,
    List<AddressModel>? address,
  }) {
    return AddressStates(
      addressModel: addressModel ?? this.addressModel,
      status: status ?? this.status,
      address: address ?? this.address,
      addresses: addresses ?? this.addresses,
    );
  }
}
