import 'package:flutter_emart_vender_side_app/Order/order_screen.dart';
import 'package:flutter_emart_vender_side_app/Settings/settings_screen.dart';
import 'package:flutter_emart_vender_side_app/const/const.dart';
import 'package:flutter_emart_vender_side_app/controllers/home_controller.dart';
import 'package:flutter_emart_vender_side_app/products/product_screen.dart';
import 'package:flutter_emart_vender_side_app/views/home_screen/home_screen.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var naveScreens = [
      const HomeScreen(),
      const ProductScreen(),
      const OrderScreen(),
      const SettingScreen(),
      // const SettingScreen(),
    ];
    var bottomNavbar = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: dashbored,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icproducts,
          color: darkGrey,
          width: 24,
        ),
        label: products,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icorders,
          color: darkGrey,
          width: 24,
        ),
        label: orders,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          icgeneralSetting,
          color: darkGrey,
          width: 24,
        ),
        label: settings,
      ),
    ];
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (index) {
            controller.navIndex.value = index;
          },
          currentIndex: controller.navIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: purpleColor,
          unselectedItemColor: darkGrey,
          items: bottomNavbar,
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(child: naveScreens.elementAt(controller.navIndex.value))
          ],
        ),
      ),
    );
  }
}
