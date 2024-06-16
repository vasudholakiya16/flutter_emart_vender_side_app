import 'package:flutter_emart_vender_side_app/Order/component/order_placed_detail_screen.dart';
import 'package:flutter_emart_vender_side_app/const/const.dart';
import 'package:flutter_emart_vender_side_app/widgets/our_button.dart';
import 'package:flutter_emart_vender_side_app/widgets/text_style.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: darkGrey,
          ),
        ),
        title: boldText(text: "Oredr Detail", color: fontGrey, size: 16.0),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: context.screenWidth,
        child: ourButton(color: green, onPress: () {}, title: "Conform Order"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // Order Delivery Section
              Visibility(
                // visible: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    boldText(text: "Order Status", color: fontGrey, size: 16.0),
                    SwitchListTile(
                      activeColor: green,
                      value: true,
                      onChanged: (value) {},
                      title: boldText(text: "Placed", color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: true,
                      onChanged: (value) {},
                      title: boldText(text: "Conformed", color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: false,
                      onChanged: (value) {},
                      title: boldText(text: "On Delivery", color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: false,
                      onChanged: (value) {},
                      title: boldText(text: "Delivered", color: fontGrey),
                    ),
                  ],
                )
                    .box
                    .padding(const EdgeInsets.all(8))
                    .outerShadowMd
                    .white
                    .border(color: lightGrey)
                    .roundedSM
                    .make(),
              ),
              //Order Detail section
              Column(
                children: [
                  orderPlacedDetails(
                      title1: "Order Code",
                      title2: "Shipping Method",
                      d1: "data['order_code']",
                      d2: "data['shipping_method']"),
                  orderPlacedDetails(
                      title1: "Order Date",
                      title2: "Payment Method",
                      d1: DateTime.now(),
                      // d1: intl.DateFormat()
                      //     .add_yMd()
                      //     .format(data['order_date'].toDate()),
                      d2: "data['payment_method']"),
                  orderPlacedDetails(
                      title1: "Payment Status",
                      title2: "Delivery Status",
                      d1: "Unpade",
                      d2: "Order Placed"),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                boldText(
                                  text: "Shipping Address",
                                  color: purpleColor,
                                ),
                                "{data['order_by_name']}".text.make(),
                                "{data['order_by_email']}".text.make(),
                                "{data['order_by_address']}".text.make(),
                                "{data['order_by_city']}".text.make(),
                                "{data['order_by_country']}".text.make(),
                                "{data['order_by_state']}".text.make(),
                                "{data['order_by_phoneNo']}".text.make(),
                                "{data['order_by_postalCode']}".text.make(),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 125,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                boldText(
                                    text: "Total Amount", color: purpleColor),
                                boldText(text: "\$300", color: red, size: 16.0),
                                // "Total Amount".text.fontFamily(semibold).make(),
                                // "${data['total_amount']}"
                                //     .text
                                //     .color(redColor)
                                //     .fontFamily(semibold)
                                //     .make(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
                  .box
                  .outerShadowMd
                  .white
                  .border(color: lightGrey)
                  .roundedSM
                  .make(),
              const Divider(),
              10.heightBox,
              boldText(text: "Ordeerd Product", color: fontGrey, size: 16.0),
              // "Ordeerd Product"
              //     .text
              //     .size(16)
              //     .color(darkFontGrey)
              //     .fontFamily(semibold)
              //     .makeCentered(),
              10.heightBox,
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(3, (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      orderPlacedDetails(
                          title1: "data['orders'][index]['title']",
                          title2: "data['orders'][index]['tPrice']",
                          d1: "{data['orders'][index]['qty']}x",
                          d2: "Refundable"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          width: 30,
                          height: 10,
                          color: purpleColor,
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                }).toList(),
              )
                  .box
                  .outerShadowMd
                  .white
                  .border(color: lightGrey)
                  .roundedSM
                  .margin(const EdgeInsets.only(bottom: 4))
                  .make(),
              30.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
