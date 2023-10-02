part of 'client_request_bloc.dart';

sealed class ClientRequestEvent extends Equatable {
  const ClientRequestEvent();
}

class AddClientRequest extends ClientRequestEvent {
  const AddClientRequest({required this.requestModelClient});

  final RequestModelClient requestModelClient;

  @override
  List<Object?> get props => [requestModelClient];
}

class UpdateClientRequest extends ClientRequestEvent {
  const UpdateClientRequest({required this.requestModelClient});

  final RequestModelClient requestModelClient;

  @override
  List<Object?> get props => [requestModelClient];
}

class DeleteClientRequest extends ClientRequestEvent {
  const DeleteClientRequest({required this.userId});

  final String userId;

  @override
  List<Object?> get props => [userId];
}
