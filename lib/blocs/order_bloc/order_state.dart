part of 'order_bloc.dart';

@immutable
class OrderState extends Equatable {
  final String statusText;
  final OrderModel orderModel;
  final FormStatus status;
  OrderState(
      {required this.statusText,
      required this.orderModel,
      required this.status});
  OrderState copyWith({
    String? statusText,
    OrderModel? orderModel,
    FormStatus? status,
  }) {
    return OrderState(
        statusText: statusText ?? this.statusText,
        orderModel: orderModel ?? this.orderModel,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [statusText, orderModel, status];
}
