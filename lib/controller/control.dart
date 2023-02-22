import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_presence_app/main.dart';

// ignore: camel_case_types
class localcontroller extends GetxController {
  var intiallang = sharedpref!.getString("lang") == null
      ? Get.deviceLocale
      : Locale(sharedpref!.getString("lang")!);

  void lang(String codelang) {
    Locale locale = Locale(codelang);
    sharedpref!.setString("lang", codelang);
    intiallang = locale;
    Get.updateLocale(locale);
  }
}
