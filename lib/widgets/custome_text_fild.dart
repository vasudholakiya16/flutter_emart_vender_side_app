import 'package:flutter_emart_vender_side_app/const/const.dart';

Widget customeTextField({label, hint, controller, isDecs = false}) {
  return TextFormField(
    maxLines: isDecs ? 4 : 1,
    controller: controller,
    decoration: InputDecoration(
      isDense: true,
      labelText: label,
      labelStyle: const TextStyle(color: white),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: white),
      ),
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey),
    ),
    style: const TextStyle(color: white),
  );
}
