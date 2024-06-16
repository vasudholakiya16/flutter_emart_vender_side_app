import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_emart_vender_side_app/const/const.dart';
import 'package:flutter_emart_vender_side_app/const/firebase_constant.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // is loading variables
  var isloading = false.obs;

// text Controllers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // Login Method
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // Store Data Method
  storeUserData({name, password, email}) async {
    DocumentReference store =
        await firestore.collection(vendorsCollections).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password': password,
      'email': email,
      'imageUrl': '',
      'id': currentUser!.uid,
      'cart_count': "00",
      'order_count': "00",
      'wishlist_count': "00"
    });
  }

  //Signout Method

  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
