import 'package:flutter_emart_vender_side_app/const/const.dart';
import 'package:flutter_emart_vender_side_app/widgets/text_style.dart';

Widget productDropDown() {
  return DropdownButtonHideUnderline(
    child: DropdownButton<String>(
      hint: normalText(text: "Choose Category", color: fontGrey, size: 16.0),
      value: null,
      isExpanded: true,
      items: const [],
      onChanged: (value) {},
    ),
  )
      .box
      .white
      .roundedSM
      .padding(const EdgeInsets.symmetric(horizontal: 4))
      .make();
}
