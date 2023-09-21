import 'package:equatable/equatable.dart';
import 'package:taxi_app/data/models/message/message_model.dart';

abstract class MessageEvent extends Equatable {}

class SendMessage extends MessageEvent {
  final MessageModel messageModel;

  SendMessage({required this.messageModel});
  @override
  List<Object?> get props => [messageModel];
}

class GetMessage extends MessageEvent {
  @override
  List<Object?> get props => [];
}
