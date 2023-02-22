import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_presence_app/controller/control.dart';
import 'local/local.dart';
import 'view/screen/splash.dart';

SharedPreferences? sharedpref;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  sharedpref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    localcontroller controllerlang = Get.put(localcontroller());
    return GetMaterialApp(
      home: const SplashPage(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          backgroundColor: const Color.fromARGB(255, 224, 224, 224),
          primaryColor: const Color.fromARGB(255, 149, 117, 205),
          buttonColor: const Color.fromARGB(255, 149, 117, 205),
          bottomAppBarColor: const Color.fromARGB(255, 224, 224, 224)),

      locale: controllerlang.intiallang,
      translations: MyLocal(),
      // getPages: [
      //   GetPage(name: "/", page: () => const HomePage()),
      // ],
    );
  }
}
