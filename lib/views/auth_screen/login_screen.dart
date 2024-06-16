// import 'package:flutter_e_commerce_seller_app/const/const.dart';
// import 'package:flutter_e_commerce_seller_app/controllers/Auth_controller.dart';
// import 'package:flutter_e_commerce_seller_app/views/home_screen/home.dart';
// import 'package:flutter_e_commerce_seller_app/widgets/our_button.dart';
// import 'package:flutter_e_commerce_seller_app/widgets/text_style.dart';
// import 'package:get/get.dart';

// class LogInScreen extends StatelessWidget {
//   const LogInScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.put(AuthController());
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: purpleColor,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               30.heightBox,
//               normalText(text: welcome, size: 22.0),
//               20.heightBox,
//               Row(
//                 children: [
//                   Image.asset(
//                     iclogo,
//                     width: 60,
//                     height: 60,
//                   )
//                       .box
//                       .border(color: white)
//                       .rounded
//                       .padding(const EdgeInsets.all(9))
//                       .make(),
//                   10.widthBox,
//                   boldText(text: appname, size: 18.0)
//                 ],
//               ),
//               60.heightBox,
//               Center(
//                   child:
//                       normalText(text: loginto, size: 18.0, color: lightGrey)),
//               10.heightBox,
//               Obx(
//                 () => Column(
//                   children: [
//                     TextFormField(
//                       controller: controller.emailController,
//                       decoration: const InputDecoration(
//                         filled: true,
//                         fillColor: textfieldGrey,
//                         prefixIcon: Icon(Icons.email),
//                         border: InputBorder.none,
//                         hintText: emailHint,
//                       ),
//                     ),
//                     20.heightBox,
//                     TextFormField(
//                       obscureText: true,
//                       controller: controller.passwordController,
//                       decoration: const InputDecoration(
//                         filled: true,
//                         fillColor: textfieldGrey,
//                         prefixIcon: Icon(Icons.lock),
//                         border: InputBorder.none,
//                         hintText: passwordHint,
//                       ),
//                     ),
//                     10.heightBox,
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: TextButton(
//                           onPressed: () {},
//                           child: normalText(
//                               text: forgotPassword, color: purpleColor)),
//                     ),
//                     20.heightBox,
//                     SizedBox(
//                       width: context.screenWidth - 100,
//                       child: controller.isloading.value
//                           ? const CircularProgressIndicator(
//                               valueColor: AlwaysStoppedAnimation(red),
//                             )
//                           : ourButton(
//                               title: login,
//                               onPress: () async {
//                                 controller.isloading(true);
//                                 await controller
//                                     .loginMethod(context: context)
//                                     .then((value) {
//                                   if (value != null) {
//                                     VxToast.show(context,
//                                         msg: "Login Successfully");
//                                     controller.isloading(false);
//                                     Get.offAll(() => const Home());
//                                   } else {
//                                     controller.isloading(false);
//                                   }
//                                 });
//                                 // Get.to(() => const Home());
//                               },
//                             ),
//                     )
//                   ],
//                 )
//                     .box
//                     .white
//                     .rounded
//                     .outerShadowMd
//                     .padding(const EdgeInsets.all(8))
//                     .make(),
//               ),
//               10.heightBox,
//               Center(
//                 child: normalText(text: anyProblem),
//               ),
//               const Spacer(),
//               Center(
//                 child: boldText(text: credit),
//               ),
//               20.heightBox,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter_emart_vender_side_app/const/const.dart';
import 'package:flutter_emart_vender_side_app/controllers/auth_controller.dart';
import 'package:flutter_emart_vender_side_app/views/home_screen/home.dart';
import 'package:flutter_emart_vender_side_app/widgets/our_button.dart';
import 'package:flutter_emart_vender_side_app/widgets/text_style.dart';
import 'package:get/get.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.heightBox,
              normalText(text: welcome, size: 22.0),
              20.heightBox,
              Row(
                children: [
                  Image.asset(
                    iclogo,
                    width: 60,
                    height: 60,
                  )
                      .box
                      .border(color: white)
                      .rounded
                      .padding(const EdgeInsets.all(9))
                      .make(),
                  10.widthBox,
                  boldText(text: appname, size: 18.0)
                ],
              ),
              60.heightBox,
              Center(
                  child:
                      normalText(text: loginto, size: 18.0, color: lightGrey)),
              10.heightBox,
              Obx(
                () => Column(
                  children: [
                    TextFormField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: textfieldGrey,
                        prefixIcon: Icon(Icons.email),
                        border: InputBorder.none,
                        hintText: emailHint,
                      ),
                    ),
                    20.heightBox,
                    TextFormField(
                      obscureText: true,
                      controller: controller.passwordController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: textfieldGrey,
                        prefixIcon: Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: passwordHint,
                      ),
                    ),
                    10.heightBox,
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            // Implement your forgot password logic here
                          },
                          child: normalText(
                              text: forgotPassword, color: purpleColor)),
                    ),
                    20.heightBox,
                    SizedBox(
                      width: context.screenWidth - 100,
                      child: controller.isloading.value
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(red),
                            )
                          : ourButton(
                              title: login,
                              onPress: () async {
                                controller.isloading(true);
                                try {
                                  await controller
                                      .loginMethod(context: context)
                                      .then((value) {
                                    if (value != null) {
                                      VxToast.show(context,
                                          msg: "Login Successfully");
                                      controller.isloading(false);
                                      Get.offAll(() => const Home());
                                    } else {
                                      controller.isloading(false);
                                    }
                                  });
                                } catch (e) {
                                  VxToast.show(context,
                                      msg: "Login failed: $e");
                                  print("Firebase Auth Error: $e");
                                  controller.isloading(false);
                                }
                              },
                            ),
                    )
                  ],
                )
                    .box
                    .white
                    .rounded
                    .outerShadowMd
                    .padding(const EdgeInsets.all(8))
                    .make(),
              ),
              10.heightBox,
              Center(
                child: normalText(text: anyProblem),
              ),
              const Spacer(),
              Center(
                child: boldText(text: credit),
              ),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
