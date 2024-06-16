import 'package:flutter/material.dart';
import 'package:flutter_emart_vender_side_app/const/colors.dart';
import 'package:flutter_emart_vender_side_app/const/strings.dart';
import 'package:flutter_emart_vender_side_app/widgets/custome_text_fild.dart';
import 'package:flutter_emart_vender_side_app/widgets/text_style.dart';

class ShopSettiong extends StatelessWidget {
  const ShopSettiong({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: boldText(
          text: shopSetings,
          color: white,
          size: 16.0,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: normalText(text: save, color: white),
          ),
        ],
        backgroundColor: purpleColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customeTextField(
                label: "Shop Name",
                hint: "eg. Enter Your shop Name",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customeTextField(
                label: "Shop Address",
                hint: shopAddressHint,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customeTextField(
                label: mobile,
                hint: shopMobileHint,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customeTextField(
                label: website,
                hint: shopWebsiteHint,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customeTextField(
                isDecs: true,
                label: description,
                hint: shopDescHint,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
