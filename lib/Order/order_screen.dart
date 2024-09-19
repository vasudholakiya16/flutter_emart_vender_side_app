import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_emart_vender_side_app/Order/order_details_screen.dart';
import 'package:flutter_emart_vender_side_app/const/const.dart';
import 'package:flutter_emart_vender_side_app/const/firebase_constant.dart';
import 'package:flutter_emart_vender_side_app/controllers/orders_controller.dart';
import 'package:flutter_emart_vender_side_app/services/store_services.dart';
import 'package:flutter_emart_vender_side_app/widgets/loadingIndigature.dart';
import 'package:flutter_emart_vender_side_app/widgets/text_style.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart' as intl;

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OrdersController());
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
      body: StreamBuilder(
        stream: StoreServices.getOrders(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return loadingIndicator();
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.data!.docs.isEmpty) {
            return Text('No data available');
          }

          var data = snapshot.data!.docs;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: List.generate(data.length, (index) {
                return ListTile(
                  onTap: () {
                    Get.to(() => const OrderDetailsScreen());
                  },
                  tileColor: textfieldGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  title: boldText(
                    text: "${data[index]['order_code']}",
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
                          const SizedBox(width: 10),
                          boldText(
                            text: intl.DateFormat()
                                .add_yMd()
                                .format(DateTime.now()),
                            color: fontGrey,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.payment,
                            color: darkGrey,
                          ),
                          const SizedBox(width: 10),
                          normalText(
                            text: "unpaid",
                            color: red,
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: boldText(
                    text: "\$40.0",
                    color: purpleColor,
                    size: 16.0,
                  ),
                ).box.margin(const EdgeInsets.only(bottom: 4)).make();
              }),
            ),
          );
        },
      ),
    );
  }
}
