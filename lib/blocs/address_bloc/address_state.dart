part of 'address_bloc.dart';

class AddressStates extends Equatable {
  final List<AddressModel> addresses;
  final AddressModel addressModel;
  final FormStatus status;

  const AddressStates({
    required this.addresses,
    required this.addressModel,
    required this.status,
  });

  @override
  List<Object?> get props => [
        addressModel,
        status,
        addresses
      ];

  AddressStates copyWith({
    AddressModel? addressModel,
    FormStatus? status,
    List<AddressModel>? addresses,
  }) {
    return AddressStates(
      addressModel: addressModel ?? this.addressModel,
      status: status ?? this.status,
      addresses: addresses ?? this.addresses,
    );
  }
}
