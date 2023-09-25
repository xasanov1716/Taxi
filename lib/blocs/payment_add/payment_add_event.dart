part of 'payment_add_bloc.dart';

@immutable
abstract class PaymentAddEvent {}

class AddCards extends PaymentAddEvent{
  final PaymentModel name;

  AddCards({required this.name});
}
class GetCards extends PaymentAddEvent{}