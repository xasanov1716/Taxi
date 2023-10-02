part of 'driver_request_bloc.dart';

sealed class DriverRequestEvent extends Equatable {
  const DriverRequestEvent();
}

class AddDriverRequest extends DriverRequestEvent {
  const AddDriverRequest({required this.requestModelDriver});

  final RequestModelDriver requestModelDriver;

  @override
  List<Object?> get props => [requestModelDriver];
}

class UpdateDriverRequest extends DriverRequestEvent {
  const UpdateDriverRequest({required this.requestModelDriver});

  final RequestModelDriver requestModelDriver;

  @override
  List<Object?> get props => [requestModelDriver];
}

class DeleteDriverRequest extends DriverRequestEvent {
  const DeleteDriverRequest({required this.userId});

  final String userId;

  @override
  List<Object?> get props => [userId];
}
