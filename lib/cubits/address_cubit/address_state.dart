part of 'address_cubit.dart';

abstract class AddressState extends Equatable {}

class AddressInitial extends AddressState {
  @override
  List<Object?> get props => [];
}

class AddressLoadingState extends AddressState {
  @override
  List<Object?> get props => [];
}

class AddressSuccessState extends AddressState {
  AddressSuccessState({required this.address});
  final String address;
  @override
  List<Object?> get props => [address];
}

class AddressErrorState extends AddressState {
  final String errorText;
  AddressErrorState({required this.errorText});
  @override
  List<Object?> get props => [errorText];
}
