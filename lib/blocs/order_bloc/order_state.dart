part of 'order_bloc.dart';

class OrderState extends Equatable {
  final String statusText;
  final OrderModel orderModel;
  final List<OrderModel> orders;
  final List<OrderModel> orderById;
  final FormStatus status;
  const OrderState(
      {required this.orders,
      required this.statusText,
      required this.orderModel,
      required this.orderById,
      required this.status});
  OrderState copyWith({
    String? statusText,
    OrderModel? orderModel,
    FormStatus? status,
    List<OrderModel>? orders,
    List<OrderModel>? orderById,
  }) {
    return OrderState(
        statusText: statusText ?? this.statusText,
        orderModel: orderModel ?? this.orderModel,
        orderById: orderById ?? this.orderById,
        orders: orders ?? this.orders,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [statusText, orderModel, status];
}
