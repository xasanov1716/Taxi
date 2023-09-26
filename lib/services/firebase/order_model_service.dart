import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_app/data/models/order/order_model.dart';
import 'package:taxi_app/data/models/universal_data.dart';

const String orderCollection = 'order';

class OrderService {
  Future<UniversalData> addOrder({required OrderModel orderModel}) async {
    try {
      DocumentReference newOrder = await FirebaseFirestore.instance
          .collection(orderCollection)
          .add(orderModel.toJson());

      await FirebaseFirestore.instance
          .collection(orderCollection)
          .doc(newOrder.id)
          .update({
        "orderId": newOrder.id,
      });

      return UniversalData(data: "Order added!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> updateOrder({required OrderModel orderModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection(orderCollection)
          .doc(orderModel.orderId)
          .update(orderModel.toJson());

      return UniversalData(data: "Order updated!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> deleteProduct({required String orderId}) async {
    try {
      await FirebaseFirestore.instance
          .collection(orderCollection)
          .doc(orderId)
          .delete();

      return UniversalData(data: "Order deleted!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }
}
