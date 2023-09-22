part of 'create_order_bloc.dart';

@immutable
abstract class CreateOrderEvent {}


class UpdatePromoCodes extends CreateOrderEvent{
final  String promoCode;
UpdatePromoCodes({required this.promoCode});
}

class ClearPromoCodes extends CreateOrderEvent{
 final  String index;
ClearPromoCodes({required this.index});
}
