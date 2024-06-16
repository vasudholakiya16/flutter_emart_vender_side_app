// ignore: depend_on_referenced_packages
import 'package:flutter_emart_vender_side_app/const/const.dart';
import 'package:flutter_emart_vender_side_app/widgets/dashboard_button.dart';
import 'package:flutter_emart_vender_side_app/widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(
          text: dashbored,
          color: fontGrey,
          size: 18.0,
        ),
        actions: [
          Center(
            child: normalText(
                text: intl.DateFormat("EEE, MMM d,").format(DateTime.now()),
                color: purpleColor),
          ),
          10.widthBox,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashBoardButton(context,
                    title: products, count: "75", icon: icproducts),
                dashBoardButton(context,
                    title: orders, count: "15", icon: icorders),
              ],
            ),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashBoardButton(context,
                    title: rating, count: "75", icon: icstar),
                dashBoardButton(context,
                    title: totalSales, count: "15", icon: ictotalSales),
              ],
            ),
            10.heightBox,
            const Divider(),
            10.heightBox,
            boldText(text: popular, color: fontGrey, size: 16.0),
            20.heightBox,
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(
                  15,
                  (index) => ListTile(
                    onTap: () {},
                    leading: Image.asset(
                      img1,
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                    title: boldText(
                      text: "Product title",
                      color: fontGrey,
                      size: 14.0,
                    ),
                    subtitle: normalText(text: "\$40.0", color: darkGrey),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
