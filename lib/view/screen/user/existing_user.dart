import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_presence_app/controller/control.dart';
import 'package:smart_presence_app/view/screen/splash.dart';
import 'package:smart_presence_app/widget/custom_existiang.dart';

class ExistingPage extends StatefulWidget {
  const ExistingPage({super.key});

  @override
  State<ExistingPage> createState() => _ExistingPageState();
}

class _ExistingPageState extends State<ExistingPage> {
  localcontroller controller = Get.find();
  late bool bottom2 = false, _expansion = false;

  @override
  Widget build(BuildContext context) {
    bool bottom = controller.intiallang == const Locale("en") ? true : false;
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_outlined)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomExisting(
                    icon: const Icon(Icons.notifications_none),
                    text: "اشعارات التسجيل",
                    widget: Switch(
                      value: bottom2,
                      activeColor: Theme.of(context).primaryColor,
                      onChanged: (vale) {},
                    ),
                    number: 16,
                  ),
                  CustomExisting(
                    icon: const Icon(Icons.language),
                    text: bottom == false
                        ? "تحويل اللغة الى انجليزي"
                        : "Convert the language to Arabic",
                    widget: Switch(
                        value: bottom,
                        activeColor: Theme.of(context).primaryColor,
                        onChanged: (vale) {
                          if (vale == false) {
                            setState(() {
                              controller.lang("ar");
                            });
                          } else {
                            setState(() {
                              controller.lang("en");
                            });
                          }
                        }),
                    number: 16,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white),
                          child: ExpansionTile(
                            title: Text(
                              "تعليمات الشركة",
                              style: TextStyle(
                                  color: _expansion
                                      ? Theme.of(context).primaryColor
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            leading: Icon(
                              Icons.lightbulb_outline,
                              color: _expansion
                                  ? Theme.of(context).primaryColor
                                  : Colors.black,
                            ),
                            trailing: Icon(
                              _expansion
                                  ? Icons.arrow_circle_up_outlined
                                  : Icons.arrow_circle_down,
                              color: _expansion
                                  ? Theme.of(context).primaryColor
                                  : Colors.black,
                            ),
                            onExpansionChanged: (bool expanded) {
                              setState(() {
                                _expansion = expanded;
                              });
                            },
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: Colors.white),
                                      child: const Text(
                                        "لا بدّ من إرسال بعض العبارات المعبرة عن المودة الدائمة، حتى عندما تكون العلاقة ممتازة بين الزوجين ومن العبارات الجميلة",
                                      )))
                            ],
                          ))),
                  GestureDetector(
                      onTap: () {},
                      child: const CustomExisting(
                        text: "جدول المحاضرات",
                        number: 6,
                        padding: true,
                      )),
                  GestureDetector(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Get.off(const SplashPage());
                      },
                      child: CustomExisting(
                        text: "تسجيل الخروج",
                        icon: const Icon(Icons.output),
                        number: 6,
                        padding: true,
                        color: Colors.red.withOpacity(0.3),
                      ))
                ],
              ),
            )));
  }
}
