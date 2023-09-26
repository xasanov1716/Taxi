part of 'payment_bloc.dart';

@immutable
class PaymentState extends Equatable {
  final String cardName;
  final String cardNumber;
  final String expireDate;

  const PaymentState(
      {required this.cardNumber,
      required this.cardName,
      required this.expireDate});

  PaymentState copyWith({
    String? cardName,
    String? cardNumber,
    String? expireDate,
  }) {
    return PaymentState(
        cardNumber: cardNumber ?? this.cardNumber,
        cardName: cardName ?? this.cardName,
        expireDate: expireDate ?? this.expireDate);
  }

  @override
  List<Object?> get props => [cardNumber, cardName, expireDate];

}
