import 'package:flutter_emart_vender_side_app/Order/order_details_screen.dart';
import 'package:flutter_emart_vender_side_app/const/const.dart';
import 'package:flutter_emart_vender_side_app/widgets/text_style.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart' as intl;

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: false,
        title: boldText(
          text: orders,
          color: fontGrey,
          size: 18.0,
        ),
        actions: [
          Center(
            child: normalText(
              text: intl.DateFormat("EEE, MMM d,").format(DateTime.now()),
              color: purpleColor,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                Get.to(() => const OrderDetailsScreen());
              },
              tileColor: textfieldGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              title: boldText(
                text: "Product Code",
                color: purpleColor,
                size: 14.0,
              ),
              subtitle: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: darkGrey,
                      ),
                      10.widthBox,
                      boldText(
                          text: intl.DateFormat()
                              .add_yMd()
                              .format(DateTime.now()),
                          color: fontGrey)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.payment,
                        color: darkGrey,
                      ),
                      10.widthBox,
                      normalText(text: unpade, color: red)
                    ],
                  ),
                  // normalText(text: "\$40.0", color: darkGrey),
                ],
              ),
              trailing:
                  boldText(text: "\$40.0", color: purpleColor, size: 16.0),
            ).box.margin(const EdgeInsets.only(bottom: 4)).make();
          },
        ),
      ),
    );
  }
}
