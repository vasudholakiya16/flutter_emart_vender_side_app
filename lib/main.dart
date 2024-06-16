import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_emart_vender_side_app/const/const.dart';
import 'package:flutter_emart_vender_side_app/const/firebase_constant.dart';
import 'package:flutter_emart_vender_side_app/views/auth_screen/login_screen.dart';
import 'package:flutter_emart_vender_side_app/views/home_screen/home.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var isLoggedin = false;
  ChangeScreen() {
    // using GetX
    // Get.to(() => const LoginScreen());
    auth.authStateChanges().listen((User? user) {
      if (user == null && mounted) {
        Get.to(() => const LogInScreen());
      } else {
        Get.to(() => const Home());
      }
    });
  }

  @override
  void initState() {
    ChangeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      home: const LogInScreen(),
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent, elevation: 0.0)),
    );
  }
}
