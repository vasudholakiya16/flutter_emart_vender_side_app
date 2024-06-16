import 'package:flutter_emart_vender_side_app/const/firebase_constant.dart';

class StoreServices {
  static getProfile(uid) {
    return firestore
        .collection(vendorsCollections)
        .where("id", isEqualTo: uid)
        .get();
  }
}
