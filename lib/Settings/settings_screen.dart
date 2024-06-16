import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_emart_vender_side_app/Settings/edit_profile_screen.dart';
import 'package:flutter_emart_vender_side_app/const/const.dart';
import 'package:flutter_emart_vender_side_app/const/firebase_constant.dart';
import 'package:flutter_emart_vender_side_app/controllers/auth_controller.dart';
import 'package:flutter_emart_vender_side_app/controllers/profile_controller.dart';
import 'package:flutter_emart_vender_side_app/messages_screen/messages_screen.dart';
import 'package:flutter_emart_vender_side_app/services/store_services.dart';
import 'package:flutter_emart_vender_side_app/shop_screen/shop_setting_screen.dart';
import 'package:flutter_emart_vender_side_app/views/auth_screen/login_screen.dart';
import 'package:flutter_emart_vender_side_app/widgets/loadingIndigature.dart';
import 'package:flutter_emart_vender_side_app/widgets/text_style.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(
          text: settings,
          color: white,
          size: 18.0,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const EditProfileScreen());
            },
            icon: const Icon(
              Icons.edit,
              color: white,
            ),
          ),
          TextButton(
              onPressed: () async {
                await Get.find<AuthController>().signoutMethod(context);
                Get.offAll(() => const LogInScreen());
              },
              child: normalText(text: logout))
        ],
      ),
      body: FutureBuilder(
          future: StoreServices.getProfile(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return loadingIndicator(circleColor: white);
            } else {
              controller.snapshortData = snapshot.data!.docs[0];
              return Column(
                children: [
                  ListTile(
                    leading: Image.asset(img1)
                        .box
                        .roundedFull
                        .clip(Clip.antiAlias)
                        .make(),
                    title:
                        boldText(text: "${controller.snapshortData['name']}"),
                    subtitle: normalText(
                        text: "${controller.snapshortData['email']}"),
                  ),
                  const Divider(),
                  10.heightBox,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: List.generate(
                          profileButtonsIconsList.length,
                          (index) => ListTile(
                                onTap: () {
                                  switch (index) {
                                    case 0:
                                      Get.to(() => const ShopSettiong());
                                      break;
                                    case 1:
                                      Get.to(() => const MessagesScreen());
                                      break;
                                    default:
                                  }
                                },
                                leading: Icon(
                                  profileButtonsIconsList[index],
                                  color: white,
                                ),
                                title: normalText(
                                    text: profileButtonsTitles[index]),
                              )),
                    ),
                  )
                ],
              );
            }
          }),
    );
  }
}
