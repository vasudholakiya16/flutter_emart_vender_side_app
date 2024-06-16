import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_emart_vender_side_app/const/const.dart';
import 'package:flutter_emart_vender_side_app/products/components/product_dropdown.dart';
import 'package:flutter_emart_vender_side_app/products/components/product_images.dart';
import 'package:flutter_emart_vender_side_app/widgets/custome_text_fild.dart';
import 'package:flutter_emart_vender_side_app/widgets/text_style.dart';

class AddNeewProduct extends StatefulWidget {
  const AddNeewProduct({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddNeewProductState createState() => _AddNeewProductState();
}

class _AddNeewProductState extends State<AddNeewProduct> {
  List<Color> selectedColors = List.generate(5, (index) => Colors.transparent);
  Color selectedColor = Colors.blue;

  void changeColor(Color color, int index) {
    setState(() {
      selectedColor = color;
      selectedColors[index] = color;
    });
  }

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
        title: boldText(text: "Add new Product", color: white, size: 16.0),
        actions: [
          TextButton(
            onPressed: () {},
            child: boldText(text: save, color: white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customeTextField(
                  hint: "eg. BMW",
                  label: "Product Name",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customeTextField(
                  isDecs: true,
                  hint: "eg. Nice Product",
                  label: "Description",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customeTextField(
                  hint: "eg. \$600",
                  label: "Price",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customeTextField(
                  hint: "eg. 20",
                  label: "Quantity",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: productDropDown(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: productDropDown(),
              ),
              const Divider(
                color: white,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: boldText(text: "Choose Product Images"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                    (index) => productImages(label: "${index + 1}"),
                  ),
                ),
              ),
              5.heightBox,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: normalText(
                  text: "First Image your display image",
                  color: lightGrey,
                ),
              ),
              const Divider(
                color: white,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: boldText(text: "Choose our product Colors"),
              ),
              Wrap(
                children: List.generate(
                  5,
                  (index) => GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Pick a color!'),
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                pickerColor: selectedColor,
                                onColorChanged: (color) {
                                  changeColor(color,
                                      index); // Pass index to update the correct color
                                },
                                colorPickerWidth: 300.0,
                                pickerAreaHeightPercent: 0.7,
                                enableAlpha: true,
                                displayThumbColor: true,
                                // ignore: deprecated_member_use
                                showLabel: true,
                                paletteType: PaletteType.hsv,
                                pickerAreaBorderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(2.0),
                                  topRight: Radius.circular(2.0),
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  setState(() {
                                    selectedColors[index] = selectedColor;
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          //  VxBox(
                          //         child: normalText(text: index, size: 16.0)
                          //             .box
                          //             .makeCentered())
                          VxBox()
                              .color(selectedColors[index])
                              .withDecoration(
                                BoxDecoration(
                                  color: selectedColors[index],
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Rounded corners
                                  border: Border.all(
                                    color: Colors.white, // Outline color
                                    width: 1.0, // Outline width
                                  ),
                                ),
                              )
                              .roundedFull
                              .size(50, 50)
                              .make(),
                          const Icon(
                            Icons.done,
                            color: white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
