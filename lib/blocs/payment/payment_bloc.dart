
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_event.dart';

part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc()
      : super(const PaymentState(cardNumber: "", cardName: "", expireDate: "")) {
    on<CardNumber>(updateCardNumber);
    on<CardName>(updateCardName);
    on<ExpireDate>(updateExpireDate);
  }

  void updateCardNumber(CardNumber event, Emitter<PaymentState> emit) {
    emit(state.copyWith(cardNumber: event.cardNumber));
  }

  void updateCardName(CardName event, Emitter<PaymentState> emit) {
    emit(state.copyWith(cardName: event.cardName));
  }

  void updateExpireDate(ExpireDate event, Emitter<PaymentState> emit) {
    emit(state.copyWith(expireDate: event.expireDate));
  }
}

bool isUzCardOrHumoCard(String cardNumber) {
  cardNumber = cardNumber.replaceAll(RegExp(r'[ -]'), '');

  if (cardNumber.length != 16) {
    return false; // Card number must have 16 digits
  }

  if (cardNumber.startsWith('8600') || cardNumber.startsWith('9860')) {
    return true; // It's an UzCard
  }

  if (cardNumber.startsWith('9860')) {
    return true; // It's a Humo card
  }
  return false;
}
