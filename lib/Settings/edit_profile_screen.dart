import 'package:flutter_emart_vender_side_app/const/const.dart';
import 'package:flutter_emart_vender_side_app/widgets/custome_text_fild.dart';
import 'package:flutter_emart_vender_side_app/widgets/text_style.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: boldText(
          text: editProfile,
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
            Image.asset(
              img1,
              width: 200,
            ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: white),
              onPressed: () {},
              child: normalText(text: changeImage, color: darkGrey),
            ),
            10.heightBox,
            const Divider(),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  customeTextField(label: "Name", hint: "eg. Vasu Dholakiya"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customeTextField(label: password, hint: passwordHint),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customeTextField(
                  label: "Conform Password", hint: passwordHint),
            ),
          ],
        ),
      ),
    );
  }
}
