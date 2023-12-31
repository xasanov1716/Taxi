import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taxi_app/data/models/order/order_model.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/data/repositories/order_repo.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepo orderRepo;

  OrderBloc({required this.orderRepo})
      : super(OrderState(
          statusText: '',
          orderModel: OrderModel(
              orderId: '',
              clientId: '',
              driverId: '',
              fromLocation: '',
              toLocation: '',
              orderPrice: 0,
              createdAt: '',
              orderStatus: ''),
          status: FormStatus.pure,
          orders: const [],
          orderById: const [],
        )) {
    on<AddOrderEvent>(addOrder);
    on<UpdateOrderEvent>(upDateOrder);
    on<DeleteOrderEvent>(deleteOrder);
  }

  Future<void> addOrder(AddOrderEvent addOrderEvent, Emitter<OrderState> emit) async {
    emit(state.copyWith(statusText: tr('loading'), status: FormStatus.loading));
    await orderRepo.addOrder(orderModel: addOrderEvent.orderModel);
    emit(state.copyWith(status: FormStatus.success, statusText:tr('success_order_add')));
  }

  Future<void> upDateOrder(UpdateOrderEvent updateOrderEvent, Emitter<OrderState> emit) async {
    emit(state.copyWith(statusText: tr('loading'), status: FormStatus.loading));
    await orderRepo.updateOrder(orderModel: updateOrderEvent.orderModel);
    emit(state.copyWith(status: FormStatus.success, statusText: tr('success_order_update')));
  }

  Future<void> deleteOrder(DeleteOrderEvent deleteOrderEvent, Emitter<OrderState> emit) async {
    emit(state.copyWith(statusText:tr('loading'), status: FormStatus.loading));
    await orderRepo.deleteOrder(orderId: deleteOrderEvent.orderId);
    emit(state.copyWith(status: FormStatus.success, statusText: tr('success_order_delete')));
  }
}
