import 'package:flutter_emart_vender_side_app/const/const.dart';
import 'package:flutter_emart_vender_side_app/controllers/profile_controller.dart';
import 'package:flutter_emart_vender_side_app/widgets/custome_text_fild.dart';
import 'package:flutter_emart_vender_side_app/widgets/loadingIndigature.dart';
import 'package:flutter_emart_vender_side_app/widgets/text_style.dart';
import 'package:get/get.dart';

class ShopSettiong extends StatelessWidget {
  const ShopSettiong({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return Obx(
      () => Scaffold(
        backgroundColor: purpleColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: boldText(
            text: shopSetings,
            color: white,
            size: 16.0,
          ),
          actions: [
            controller.isloading.value
                ? loadingIndicator(circleColor: white)
                : TextButton(
                    onPressed: () async {
                      controller.isloading(true);
                      await controller.shopUpdate(
                        controller.shopNameController.text,
                        controller.shopAddressController.text,
                        controller.shopMobileController.text,
                        controller.shopWesiteController.text,
                        controller.shopDescriptionController.text,
                      );
                      VxToast.show(context, msg: "Saved.. ");
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customeTextField(
                    label: "Shop Name",
                    hint: "eg. Enter Your shop Name",
                    controller: controller.shopNameController),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customeTextField(
                    label: "Shop Address",
                    hint: shopAddressHint,
                    controller: controller.shopAddressController),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customeTextField(
                    label: mobile,
                    hint: shopMobileHint,
                    controller: controller.shopMobileController),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customeTextField(
                    label: website,
                    hint: shopWebsiteHint,
                    controller: controller.shopWesiteController),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customeTextField(
                    isDecs: true,
                    label: description,
                    hint: shopDescHint,
                    controller: controller.shopDescriptionController),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
