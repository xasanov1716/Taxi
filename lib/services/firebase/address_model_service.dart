import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planeta_uz/data/model/product_model.dart';
import 'package:planeta_uz/data/model/universal.dart';


class ProductService {
  final String productsCollection = 'products';
  static Future<UniversalData> addProduct(
      {required ProductModel productModel}) async {
    try {
      DocumentReference newProduct = await FirebaseFirestore.instance
          .collection(productsCollection)
          .add(productModel.toJson());

      await FirebaseFirestore.instance
          .collection(productsCollection)
          .doc(newProduct.id)
          .update({
        "productId": newProduct.id,
      });

      return UniversalData(data: "Product added!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  static Future<UniversalData> updateProduct(
      {required ProductModel productModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection(productsCollection)
          .doc(productModel.productId)
          .update(productModel.toJson());

      return UniversalData(data: "Product updated!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  static Future<UniversalData> deleteProduct(
      {required String productId}) async {
    try {
      await FirebaseFirestore.instance
          .collection(productsCollection)
          .doc(productId)
          .delete();

      return UniversalData(data: "Product deleted!");
    } on FirebaseException catch (e) {
      return UniversalData(error: e.code);
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }
}
