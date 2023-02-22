import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MyLocal implements Translations {
  final dataref = FirebaseFirestore.instance.collection("data entry").get();

  // dataref.docs;

  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "smart": "الحضور الذكي",
          "name": "اسم الدكتور",
          "college": "اسم الكلية",
          "record": "تسجيل الحضور",
          "checkout": "تسجيل الانصراف",
          "home": "الرئيسية",
          "vacation": "اجازة",
          "arithmetic": "حسابي",
        },
        "en": {
          "smart": "Smart Presence",
          "name": "Doctor is Name",
          "college": "College Name",
          "record": "Record attendance",
          "checkout": "Checkout registration",
          "home": "Home",
          "vacation": "Vacation",
          "arithmetic": "Arithmetic",
        }
      };
}
