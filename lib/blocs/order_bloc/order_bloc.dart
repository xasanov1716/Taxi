import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:taxi_app/data/models/order/order_model.dart';
import 'package:taxi_app/data/models/status/form_status.dart';
import 'package:taxi_app/data/repositories/firebase_repositories/order_repo.dart';

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
        )) {
    on<AddOrderEvent>(addOrder);
    on<UpdateOrderEvent>(upDateOrder);
    on<DeleteOrderEvent>(deleteOrder);
  }
  Future<void>addOrder(AddOrderEvent addOrderEvent,Emitter<OrderState>emitter)async{
    emit(state.copyWith(statusText: "loading...",status: FormStatus.loading));
    await orderRepo.addOrder(orderModel:addOrderEvent.orderModel );
    emit(state.copyWith(status: FormStatus.success,statusText: "success add order"));
  }
  Future<void>upDateOrder(UpdateOrderEvent updateOrderEvent,Emitter<OrderState>emitter)async{
    emit(state.copyWith(statusText: "loading...",status: FormStatus.loading));
    await orderRepo.updateOrder(orderModel: updateOrderEvent.orderModel);
    emit(state.copyWith(status: FormStatus.success,statusText: "success update order..."));
  }
  Future<void> deleteOrder(DeleteOrderEvent deleteOrderEvent, Emitter<OrderState> emitter) async {
    emit(state.copyWith(statusText: "loading...", status: FormStatus.loading));
    await orderRepo.deleteOrder(orderId: deleteOrderEvent.orderId);
    emit(state.copyWith(status: FormStatus.success, statusText: "success delete order"));
  }

}
