import 'dart:io';

import 'package:flutter_emart_vender_side_app/const/const.dart';
import 'package:flutter_emart_vender_side_app/controllers/profile_controller.dart';
import 'package:flutter_emart_vender_side_app/widgets/custome_text_fild.dart';
import 'package:flutter_emart_vender_side_app/widgets/loadingIndigature.dart';
import 'package:flutter_emart_vender_side_app/widgets/text_style.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  final String? username;
  const EditProfileScreen({super.key, this.username});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var controller = Get.find<ProfileController>();
  @override
  void initState() {
    controller.nameController.text = widget.username!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: purpleColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: boldText(
            text: editProfile,
            color: white,
            size: 16.0,
          ),
          actions: [
            controller.isloading.value
                ? loadingIndicator(circleColor: white)
                : TextButton(
                    onPressed: () async {
                      controller.isloading(true);
                      // if Image is not selected
                      if (controller.ProfileImagePath.value.isNotEmpty) {
                        await controller.uplodeProfileImage();
                      } else {
                        controller.profileImageLink =
                            controller.snapshortData['imageUrl'];
                      }
                      // old password matches your database
                      if (controller.snapshortData['password'] ==
                          controller.oldpassController.text) {
                        await controller.changeAuthPassword(
                            email: controller.snapshortData['email'],
                            password: controller.oldpassController.text,
                            newpassword: controller.newpassController.text);
                        await controller.updateProfile(
                            imageUrl: controller.profileImageLink,
                            name: controller.nameController.text,
                            password: controller.newpassController.text);
                        VxToast.show(context, msg: "Updated");
                      } else if (controller
                              .oldpassController.text.isEmptyOrNull &&
                          controller.newpassController.text.isEmptyOrNull) {
                        await controller.updateProfile(
                            imageUrl: controller.profileImageLink,
                            name: controller.nameController.text,
                            password: controller.snapshortData['password']);
                      } else {
                        VxToast.show(context, msg: "Save ");
                        controller.isloading(false);
                      }
                    },
                    child: normalText(text: save, color: white),
                  ),
          ],
          backgroundColor: purpleColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              controller.snapshortData['imageUrl'] == '' &&
                      controller.ProfileImagePath.isEmpty
                  ? Image.asset(
                      img1,
                      width: 150,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : controller.snapshortData['imageUrl'] != '' &&
                          controller.ProfileImagePath.isEmpty
                      ? Image.network(
                          controller.snapshortData['imageUrl'],
                          width: 150,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make()
                      : Image.file(
                          File(controller.ProfileImagePath.value),
                          width: 150,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: white),
                onPressed: () {
                  controller.changeImage(context);
                },
                child: normalText(text: changeImage, color: darkGrey),
              ),
              10.heightBox,
              const Divider(),
              10.heightBox,
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: normalText(text: "Change Your UserName"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customeTextField(
                    label: "Name",
                    hint: "eg. Vasu Dholakiya",
                    controller: controller.nameController),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: boldText(text: "Change Your Password"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customeTextField(
                    label: password,
                    hint: passwordHint,
                    controller: controller.oldpassController),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customeTextField(
                    label: "Conform Password",
                    hint: passwordHint,
                    controller: controller.newpassController),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
