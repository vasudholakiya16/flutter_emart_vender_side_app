import 'package:flutter_emart_vender_side_app/const/colors.dart';
import 'package:flutter_emart_vender_side_app/const/const.dart';
import 'package:flutter_emart_vender_side_app/widgets/text_style.dart';

Widget ourButton({title, color = purpleColor, onPress}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(12),
          backgroundColor: color),
      onPressed: onPress,
      child: boldText(text: title, size: 16.0));
}
