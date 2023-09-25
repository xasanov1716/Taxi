import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/data/models/payment/payment_model.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

part 'payment_add_event.dart';

part 'payment_add_state.dart';

class PaymentAddBloc extends Bloc<PaymentAddEvent, PaymentAddState> {
  PaymentAddBloc() : super(const PaymentAddState(cards: [])) {
    on<GetCards>(getCard);
    on<AddCards>(addCards);
    add(GetCards());
  }

  List<PaymentModel> payments = [
    PaymentModel(paymentIcon: AppIcons.payPal, title: "PayPal", price: 180),
    PaymentModel(
        paymentIcon: AppIcons.googlePay, title: "Google Pay", price: 180),
    PaymentModel(
        paymentIcon: AppIcons.applePay, title: "Apple Pay", price: 180),
    PaymentModel(
        paymentIcon: AppIcons.masterCard, title: "masterCard", price: 180),
  ];

  void getCard(GetCards event, Emitter<PaymentAddState> emitter) {
    emit(state.copyWith(cards: payments));
  }

  void addCards(AddCards event, Emitter<PaymentAddState> emitter) {
    payments.add(event.name);
    add(GetCards());
  }
}
