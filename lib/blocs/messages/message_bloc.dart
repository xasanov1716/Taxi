import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/blocs/messages/message_event.dart';
import 'package:taxi_app/blocs/messages/message_state.dart';
import 'package:taxi_app/data/models/message/message_model.dart';
import 'package:taxi_app/data/models/status/form_status.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc()
      : super(
          MessageState(
              message: MessageModel(
                receiverName: '',
                senderName: '',
                dateTime: '',
              ),
              messages: const [],
              errorText: '',
              status: FormStatus.pure),
        ) {
    on<GetMessage>(getMessage);
    on<SendMessage>(sendMessage);
  }

  List<MessageModel> x = [];

  getMessage(GetMessage event, Emitter<MessageState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    // await Future.delayed(const Duration(seconds: 1));

    emit(state.copyWith(status: FormStatus.success, messages: x));
  }

  sendMessage(SendMessage event, Emitter<MessageState> emit) async {
    emit(state.copyWith(status: FormStatus.loading));
    // await Future.delayed(const Duration(seconds: 1));
    x.add(event.messageModel);
    emit(state.copyWith(status: FormStatus.success, messages: x));
    add(GetMessage());
  }
}
