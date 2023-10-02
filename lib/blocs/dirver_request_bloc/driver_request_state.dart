part of 'driver_request_bloc.dart';

class DriverRequestState extends Equatable {
  const DriverRequestState(
      {this.errorText = '',
      this.statusRequest = FormStatus.pure,
      this.requestModelDriver = const RequestModelDriver.initial()});

  final String errorText;
  final FormStatus statusRequest;
  final RequestModelDriver requestModelDriver;

  DriverRequestState copyWith({
    String? errorText,
    FormStatus? statusRequest,
    RequestModelDriver? requestModelDriver,
  }) =>
      DriverRequestState(
        errorText: errorText ?? this.errorText,
        statusRequest: statusRequest ?? this.statusRequest,
        requestModelDriver: requestModelDriver ?? this.requestModelDriver,
      );

  @override
  List<Object?> get props => [
        errorText,
        statusRequest,
        requestModelDriver,
      ];
}


