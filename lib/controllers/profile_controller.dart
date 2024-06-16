import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_emart_vender_side_app/const/const.dart';
import 'package:flutter_emart_vender_side_app/const/firebase_constant.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  late QueryDocumentSnapshot snapshortData;
  // ignore: non_constant_identifier_names
  var ProfileImagePath = ''.obs;
  var profileImageLink = '';
  var isloading = false.obs;

  // Text fields
  var nameController = TextEditingController();
  var oldpassController = TextEditingController();
  var newpassController = TextEditingController();
  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      ProfileImagePath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  // Upload profile image

  uplodeProfileImage() async {
    var filename = basename(ProfileImagePath.value);
    var destination = 'images/${currentUser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(ProfileImagePath.value));
    profileImageLink = await ref.getDownloadURL();
  }

  // Update profile
  updateProfile({name, password, imageUrl}) async {
    var store = firestore.collection(vendorsCollections).doc(currentUser!.uid);
    await store.set({
      'name': name,
      'password': password,
      'imageUrl': imageUrl,
    }, SetOptions(merge: true));
    isloading(false);
  }

  // Change Auth Password
  changeAuthPassword({email, password, newpassword}) async {
    final cred = EmailAuthProvider.credential(email: email, password: password);
    await currentUser!.reauthenticateWithCredential(cred).then((value) {
      currentUser!.updatePassword(newpassword);
    }).catchError((error) {
      print(error.toString());
    });
  }
}
