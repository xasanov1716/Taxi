part of 'address_bloc.dart';

class AddressState extends Equatable {
  final List<AddressModel> addresses;
  final AddressModel addressModel;
  List<AddressModel> address;

  final FormStatus status;
  AddressState(
      {required this.addresses,
      required this.addressModel,
      required this.status,
      required this.address});

  @override
  List<Object?> get props => [address, addressModel, status];
  AddressState copyWith({
    AddressModel? addressModel,
    FormStatus? status,
    List<AddressModel>? addresses,
    List<AddressModel>? address,
  }) {
    return AddressState(
      addressModel: addressModel ?? this.addressModel,
      status: status ?? this.status,
      address: address ?? this.address,
      addresses: addresses ?? this.addresses,
    );
  }
}
