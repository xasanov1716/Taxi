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
}
