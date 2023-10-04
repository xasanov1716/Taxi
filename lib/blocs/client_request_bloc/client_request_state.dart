part of 'client_request_bloc.dart';

class ClientRequestState extends Equatable {
  const ClientRequestState(
      {this.errorText = '',
      this.statusRequest = FormStatus.pure,
      this.requestModelClient = const RequestModel.initial()});

  final String errorText;
  final FormStatus statusRequest;
  final RequestModel requestModelClient;

  ClientRequestState copyWith({
    String? errorText,
    FormStatus? statusRequest,
    RequestModel? requestModelClient,
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
