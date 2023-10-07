import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/cubits/order_cubit/order_state.dart';
import 'package:taxi_app/data/models/order/order_field_keys.dart';
import 'package:taxi_app/data/models/order/order_model.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit()
      : super(OrderState(
            errorText: '',
            orderModel: OrderModel(
                orderId: '',
                clientId: '',
                driverId: '',
                fromLocation: '',
                toLocation: '',
                orderPrice: 0,
                createdAt: '',
                orderStatus: '')));

  updateCurrentOrderField({required OrderFieldKeys fieldKey, required value}) {
    OrderModel currentOrder = state.orderModel;

    switch (fieldKey) {
      case OrderFieldKeys.orderId:
        {
          currentOrder = currentOrder.copyWith(orderId: value as String);
          break;
        }
      case OrderFieldKeys.clientId:
        {
          currentOrder = currentOrder.copyWith(clientId: value as String);
          break;
        }
      case OrderFieldKeys.driverId:
        {
          currentOrder = currentOrder.copyWith(driverId: value as String);
          break;
        }
      case OrderFieldKeys.orderStatus:
        {
          currentOrder = currentOrder.copyWith(orderStatus: value as String);
          break;
        }
      case OrderFieldKeys.fromLocation:
        {
          currentOrder = currentOrder.copyWith(fromLocation: value as String);
          break;
        }
      case OrderFieldKeys.toLocation:
        {
          currentOrder = currentOrder.copyWith(toLocation: value as String);
          break;
        }
      case OrderFieldKeys.orderPrice:
        {
          currentOrder = currentOrder.copyWith(orderPrice: value as int);
          break;
        }
      case OrderFieldKeys.createdAt:
        {
          currentOrder = currentOrder.copyWith(createdAt: value as String);
          break;
        }
    }
  }

  bool canRegister() {
    OrderModel currentOrder = state.orderModel;
    if (currentOrder.orderId.isEmpty) {
      return false;
    }

    if (currentOrder.clientId.isEmpty) {
      return false;
    }

    if (currentOrder.driverId.isEmpty) {
      return false;
    }

    if (currentOrder.fromLocation.isEmpty) {
      return false;
    }

    if (currentOrder.toLocation.isEmpty) {
      return false;
    }

    if (currentOrder.orderPrice == 0) {
      return false;
    }

    if (currentOrder.createdAt.isEmpty) {
      return false;
    }

    if (currentOrder.orderStatus.isEmpty) {
      return false;
    }

    return true;
  }
}
