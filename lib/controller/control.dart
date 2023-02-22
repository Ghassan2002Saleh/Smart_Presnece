import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_presence_app/main.dart';
import 'package:smart_presence_app/view/screen/user/bottom_navigation_bar_user.dart';
import 'package:smart_presence_app/view/screen/user/data_entry_user.dart';
import 'package:smart_presence_app/view/screen/user/info_screen.dart';

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

  splashLogin() {
    User? user = FirebaseAuth.instance.currentUser;
    bool islogin = user == null ? false : true;
    String? shared = sharedpref?.getString("entry");
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    islogin == false
        ? Get.off(const AnimationScrol())
        : islogin == true && shared != null && shared == uid
            ? Get.off(const BottomNavigationBarUser())
            : Get.off(const DataEntryUser());
  }
}
