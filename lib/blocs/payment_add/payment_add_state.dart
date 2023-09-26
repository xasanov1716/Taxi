part of 'payment_add_bloc.dart';

@immutable

class PaymentAddState extends Equatable {
  final List<PaymentModel> cards;

  const PaymentAddState(
      {required this.cards});

  PaymentAddState copyWith({
    List<PaymentModel>? cards,
  }) {
    return PaymentAddState(
        cards: cards ?? this.cards);
  }

  @override
  List<Object?> get props => [cards];
}
