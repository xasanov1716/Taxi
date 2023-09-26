import 'package:taxi_app/data/models/order/order_model.dart';

class OrderState {
  final String errorText;
  final OrderModel orderModel;

  OrderState({
    required this.errorText,
    required this.orderModel
    });

  OrderState copyWith({
    String? errorText,
    OrderModel? orderModel,
  })=>OrderState(
  errorText: errorText ?? this.errorText,
  orderModel: orderModel ?? this.orderModel
  );
}