import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_app/data/models/order/order_model.dart';
import 'package:taxi_app/data/models/universal_data.dart';
import 'package:taxi_app/services/firebase/order_model_service.dart';

class OrderRepo {
  final OrderService orderService;

  OrderRepo({required this.orderService});
  Future<UniversalData> addOrder({required OrderModel orderModel}) async {
    return await orderService.addOrder(orderModel: orderModel);
  }

  Future<UniversalData> updateOrder({required OrderModel orderModel}) async {
    return await orderService.updateOrder(orderModel: orderModel);
  }

  Future<UniversalData> deleteOrder({required String orderId}) async {
    return await orderService.deleteProduct(orderId: orderId);
  }


  Stream<List<OrderModel>> getOrders() async* {
    yield* FirebaseFirestore.instance
        .collection(orderCollection)
        .snapshots()
        .map(
          (querySnapshot) => querySnapshot.docs
          .map((doc) => OrderModel.fromJson(doc.data()))
          .toList(),
    );
  }

  Stream<List<OrderModel>> getOrdersById(
      {required String orderId}) async* {
    yield* FirebaseFirestore.instance
        .collection(orderCollection)
        .where("orderId", isEqualTo: orderId)
        .snapshots()
        .map(
          (querySnapshot) => querySnapshot.docs
          .map((doc) => OrderModel.fromJson(doc.data()))
          .toList(),
    );
  }
}
