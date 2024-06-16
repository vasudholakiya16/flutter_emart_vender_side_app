import 'package:flutter_emart_vender_side_app/const/const.dart';
import 'package:flutter_emart_vender_side_app/widgets/text_style.dart';

Widget orderPlacedDetails({title1, title2, d1, d2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 7.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            boldText(text: "$title1", color: purpleColor),
            boldText(text: "$d1", color: red),
            // "$title1".text.fontFamily(semibold).make(),
            // "$d1".text.color(redColor).fontFamily(semibold).make(),
          ],
        ),
        SizedBox(
          width: 125,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boldText(text: "$title2", color: purpleColor),
              boldText(text: "$d2", color: fontGrey),
            ],
          ),
        ),
      ],
    ),
  );
}
