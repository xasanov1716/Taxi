part of 'driver_request_bloc.dart';

sealed class DriverRequestEvent extends Equatable {
  const DriverRequestEvent();
}

class AddDriverRequest extends DriverRequestEvent {



  @override
  List<Object?> get props => [];
}
class InitDBRegions extends DriverRequestEvent {



  @override
  List<Object?> get props => [];
}

class UpdateDriverRequest extends DriverRequestEvent {
  const UpdateDriverRequest({required this.requestModelDriver});

  final RequestModel requestModelDriver;

  @override
  List<Object?> get props => [requestModelDriver];
}

class DeleteDriverRequest extends DriverRequestEvent {
  const DeleteDriverRequest({required this.userId});

  final String userId;

  @override
  List<Object?> get props => [userId];
}

class UpdateCurrentDriverField extends DriverRequestEvent{
  final RequestField fieldKey;
  final dynamic value;
  UpdateCurrentDriverField({required this.fieldKey, required this.value});

  @override

  List<Object?> get props => throw UnimplementedError();
}

