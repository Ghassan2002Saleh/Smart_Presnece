import 'package:flutter/material.dart';
import 'package:smart_presence_app/widget/button.dart';
import 'package:smart_presence_app/widget/text_form.dart';

class CustomPermissionPage extends StatefulWidget {
  const CustomPermissionPage({super.key});

  @override
  State<CustomPermissionPage> createState() => _CustomPermissionPageState();
}

class _CustomPermissionPageState extends State<CustomPermissionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: ListView(padding: const EdgeInsets.all(0.0), children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_outlined)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 20, left: 20, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "طلب اجازة",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomTextForm(
                          titleText: "نوع العذر", hintText: "العذر"),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomTextForm(
                          titleText: "البداية", hintText: "تاريخ"),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomTextForm(
                          titleText: "النهاية", hintText: "تاريخ"),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "مرفق",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).buttonColor)),
                          onPressed: () {},
                          child: const Text("مرفق")),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomTextForm(
                        titleText: "السبب",
                        hintText: "السبب",
                        line1: 1,
                        line2: 5,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Button(text: "طلب", function: () {})
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
