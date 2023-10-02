part of 'client_request_bloc.dart';

class ClientRequestState extends Equatable {
  const ClientRequestState(
      {this.errorText = '',
      this.statusRequest = FormStatus.pure,
      this.requestModelClient = const RequestModelClient.initial()});

  final String errorText;
  final FormStatus statusRequest;
  final RequestModelClient requestModelClient;

  ClientRequestState copyWith({
    String? errorText,
    FormStatus? statusRequest,
    RequestModelClient? requestModelClient,
  }) =>
      ClientRequestState(
        errorText: errorText ?? this.errorText,
        statusRequest: statusRequest ?? this.statusRequest,
        requestModelClient: requestModelClient ?? this.requestModelClient,
      );

  @override
  List<Object?> get props => [
        errorText,
        statusRequest,
    requestModelClient,
      ];
}


