import 'package:flutter_emart_vender_side_app/const/const.dart';
import 'package:flutter_emart_vender_side_app/widgets/text_style.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText(text: "Product Title", color: fontGrey, size: 16.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Swiper section
            VxSwiper.builder(
              autoPlay: true,
              height: 350,
              itemCount: 5,
              // itemCount: 3,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
              itemBuilder: (context, index) {
                return Image.asset(
                  img1,
                  // imgB2,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
            10.heightBox,
            // Title and some extra details
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldText(text: "Product Title", color: fontGrey, size: 16.0),
                  // title!.text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                  10.heightBox,
                  Row(
                    children: [
                      boldText(
                        text: "Category",
                        color: fontGrey,
                        size: 16.0,
                      ),
                      10.widthBox,
                      normalText(
                        text: "Sub-Category",
                        color: fontGrey,
                        size: 16.0,
                      ),
                    ],
                  ),
                  10.heightBox,
                  // Rating
                  VxRating(
                    isSelectable: false,
                    // value: double.parse(data['p_rating']),
                    value: 4.6,
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    maxRating: 5,
                  ),
                  10.heightBox,
                  boldText(text: "\$300", color: red, size: 18.0),
                  // "${data['p_price']}"
                  //     .numCurrency
                  //     .text
                  //     .color(redColor)
                  //     .fontFamily(bold)
                  //     .size(18)
                  //     .make(),
                  20.heightBox,
                  // Color Section

                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: boldText(
                                text: "Color:", color: fontGrey, size: 14.0),
                            // child: "Color: ".text.color(fontGrey).make(),
                          ),
                          Row(
                            children: List.generate(
                              5,
                              (index) => VxBox()
                                  .size(40, 40)
                                  .roundedFull
                                  .color(Vx.randomPrimaryColor)
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 3))
                                  .make()
                                  .onTap(() {
                                // controller.changeColorIndex(index);
                              }),
                            ),
                          ),
                        ],
                      ),
                      10.heightBox,
                      // Quantity row
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: boldText(
                                text: "Quantity: ",
                                color: fontGrey,
                                size: 14.0),
                            // child: "Quantity: ".text.color(fontGrey).make(),
                          ),
                          normalText(
                            text: "30 items",
                            color: fontGrey,
                            size: 12.0,
                          ),
                        ],
                      ),
                    ],
                  ).box.white.padding(const EdgeInsets.all(8)).make(),
                  // Description Section
                  const Divider(),
                  10.heightBox,
                  boldText(
                    text: "Description: ",
                    color: fontGrey,
                    size: 14.0,
                  ),
                  normalText(
                      text: "Description of the product...",
                      color: fontGrey,
                      size: 12.0)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
