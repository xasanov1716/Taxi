part of 'address_bloc.dart';

@immutable
abstract class AddressEvent {}

class GetAddressEvent extends AddressEvent {}

class AddAddressEvent extends AddressEvent {
  final AddressModel addressModel;

  AddAddressEvent({required this.addressModel});
}

class UpdateAddressEvent extends AddressEvent {
  final AddressModel addressModel;

  UpdateAddressEvent({required this.addressModel});
}

class DeleteAddressEvent extends AddressEvent {
  final String addressId;

  DeleteAddressEvent({required this.addressId});
}
class GetAddressByIdEvent extends AddressEvent {
  final String addressId;

  GetAddressByIdEvent({required this.addressId});
}
