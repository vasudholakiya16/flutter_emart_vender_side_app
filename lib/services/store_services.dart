import 'package:flutter_emart_vender_side_app/const/firebase_constant.dart';

class StoreServices {
  static getProfile(uid) {
    return firestore
        .collection(vendorsCollections)
        .where("id", isEqualTo: uid)
        .get();
  }

  static getMessages(uid) {
    return firestore
        .collection(chatCollections)
        .where('toId', isEqualTo: uid)
        .snapshots();
  }

  static getOrders(uid) {
    firestore
        .collection(ordersCollections)
        .where('payment_method', isEqualTo: uid)
        .snapshots();
  }

  static getProducts(uid) {
    return firestore
        .collection(productCollections)
        .where('vendor_id', isEqualTo: uid)
        .snapshots();
  }
}
