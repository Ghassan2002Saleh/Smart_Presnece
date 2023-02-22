import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../main.dart';
import 'user/bottom_navigation_bar_user.dart';
import 'user/data_entry_user.dart';
import 'user/info_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

User? user = FirebaseAuth.instance.currentUser;

class _SplashPageState extends State<SplashPage> {
  bool islogin = user == null ? false : true;
  String? shared = sharedpref?.getString("entry");
  String? uid = FirebaseAuth.instance.currentUser?.uid;
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      islogin == false
          ? Get.off(const AnimationScrol())
          : islogin == true && shared != null && shared == uid
              ? Get.off(const BottomNavigationBarUser())
              : Get.off(const DataEntryUser());
    });
    // navigator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                "smart".tr,
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Opacity(
                opacity: 0.25,
                child: Image.asset(
                  "images/fingerprint.png",
                  width: Get.width / 1.9,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
