import 'package:flutter/material.dart';
import 'package:smart_presence_app/view/screen/admin/bottom_navigation_bar_admin.dart';
import 'package:smart_presence_app/widget/button.dart';
import 'package:smart_presence_app/widget/custom_text_body.dart';
import 'package:smart_presence_app/widget/text_form_field.dart';
import '../user/bottom_navigation_bar_user.dart';
import '../user/login_user.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                Opacity(
                  opacity: 0.2,
                  child: Image.asset(
                    "images/fingerprint.png",
                    width: 80,
                    height: 120,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Opacity(
                    opacity: 0.15,
                    child: SizedBox(
                      width: size.width,
                      height: size.height / 1.7,
                      child: Image.asset(
                        "images/fingerprint.png",
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    // CustomTextField(
                    //   textInputType: TextInputType.name,
                    //   text: "الاسم",
                    //   icon: const Icon(Icons.person_outline_sharp),

                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    // CustomTextField(
                    //   textInputType: TextInputType.emailAddress,
                    //   text: "عنوان البريد الالكتروني",
                    //   icon: const Icon(Icons.email_outlined),

                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    // CustomTextField(
                    //   textInputType: TextInputType.visiblePassword,
                    //   text: "كلمة السر",
                    //   icon: const Icon(Icons.lock_open),
                    // ),
                  ],
                )
              ],
            ),
            Button(
                text: "تسجيل الدخول",
                function: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const BottomNavigationBarAdmin();
                    },
                  ));
                }),
            const SizedBox(
              height: 20,
            ),
            // CustomText(
            //   text1: "هل لديك حساب ؟ ",
            //   function: () {
            //     Navigator.push(context, MaterialPageRoute(
            //       builder: (context) {
            //         return const LoginPage();
            //       },
            //     ));
            //   },
            //   text: "تسجيل الدخول",
            // ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
