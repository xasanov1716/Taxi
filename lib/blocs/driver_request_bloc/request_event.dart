part of 'request_bloc.dart';

sealed class RequestEvent extends Equatable {
  const RequestEvent();
}

class AddRequest extends RequestEvent {

  @override
  List<Object?> get props => [];
}

class InitDBRegions extends RequestEvent {
  @override
  List<Object?> get props => [];
}

class UpdateRequest extends RequestEvent {
  const UpdateRequest({
    required this.requestModel,
  });


  final RequestModel requestModel;

  @override
  List<Object?> get props => [
        requestModel,
      ];
}

class DeleteRequest extends RequestEvent {
  const DeleteRequest({
    required this.userId,
  });

  final String userId;

  @override
  List<Object?> get props => [userId];
}

class UpdateCurrentField extends RequestEvent {
  final RequestField fieldKey;
  final dynamic value;

  const UpdateCurrentField({required this.fieldKey, required this.value});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class ClearAll extends RequestEvent {
  @override
  List<Object?> get props => [];
}
