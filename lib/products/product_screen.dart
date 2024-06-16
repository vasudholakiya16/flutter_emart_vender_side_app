import 'package:flutter_emart_vender_side_app/const/const.dart';
import 'package:flutter_emart_vender_side_app/products/add_new_product.dart';
import 'package:flutter_emart_vender_side_app/products/product_detail_screen.dart';
import 'package:flutter_emart_vender_side_app/widgets/text_style.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart' as intl;

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        onPressed: () {
          Get.to(() => const AddNeewProduct());
        },
        child: const Icon(
          Icons.add,
          color: white,
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(
          text: products,
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
                Get.to(() => const ProductDetailScreen());
              },
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
              subtitle: Row(
                children: [
                  normalText(text: "\$40.0", color: darkGrey),
                  10.widthBox,
                  boldText(text: "Featured", color: green)
                ],
              ),
              trailing: VxPopupMenu(
                  arrowSize: 0.0,
                  menuBuilder: () => Column(
                        children: List.generate(
                            popuplenuTitles.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      Icon(popuplenuIconsList[index]),
                                      10.widthBox,
                                      normalText(
                                          text: popuplenuTitles[index],
                                          color: darkGrey)
                                    ],
                                  ).onTap(() {}),
                                )),
                      ).box.white.roundedSM.width(200).make(),
                  clickType: VxClickType.singleClick,
                  child: const Icon(Icons.more_vert_rounded)),
            );
          },
        ),
      ),
    );
  }
}
