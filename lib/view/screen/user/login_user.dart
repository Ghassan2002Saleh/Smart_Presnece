import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_presence_app/view/screen/user/data_entry_user.dart';
import 'package:smart_presence_app/widget/button.dart';
import 'package:smart_presence_app/widget/custom_text_body.dart';
import 'package:smart_presence_app/widget/dialog.dart';
import 'package:smart_presence_app/widget/text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'fingerprint_user.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GlobalKey<FormState> formstate = GlobalKey<FormState>();
    String? emailAddress, password;
    bool passwordobscure = true;

    login() async {
      var formdata = formstate.currentState;
      if (formdata!.validate()) {
        formdata.save();
        try {
          UserCredential credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress!, password: password!);
          return credential;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            AwesomeDialog(
                    context: context,
                    title: "error",
                    body: const Text("No user found for that email"),
                    dialogType: DialogType.error)
                .show();
          } else if (e.code == 'wrong-password') {
            AwesomeDialog(
                    context: context,
                    title: "error",
                    body: const Text("Wrong password"),
                    dialogType: DialogType.error)
                .show();
          }
          AwesomeDialog(
                  context: context,
                  title: "error",
                  body: const Text("خطأ"),
                  dialogType: DialogType.error)
              .show();
        }
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: ListView(
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
              alignment: Alignment.bottomCenter,
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
                Form(
                  key: formstate,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          textInputType: TextInputType.emailAddress,
                          text: "عنوان البريد الالكتروني",
                          icon: const Icon(Icons.email_outlined),
                          functionsave: (val) {
                            emailAddress = val;
                          },
                          functionvalidator: (value) {
                            if (value!.length > 30) {
                              return "البريد أكبر من 30";
                            }
                            if (value.length < 10) {
                              return "البريد أقل من 10";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordobscure = !passwordobscure;
                              });
                            },
                            icon: Icon(passwordobscure == false
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off_outlined),
                          ),
                          obscureText: passwordobscure,
                          textInputType: TextInputType.visiblePassword,
                          text: "كلمة السر",
                          icon: const Icon(Icons.lock_open),
                          functionsave: (val) {
                            password = val;
                          },
                          functionvalidator: (value) {
                            if (value!.length > 30) {
                              return "كلمة السر أكبر من 30";
                            }
                            if (value.length < 9) {
                              return "كلمة السر أقل من 10";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 110,
                        ),
                        Button(
                            text: "تسجيل الدخول",
                            function: () async {
                              UserCredential? response = await login();
                              if (response != null) {
                                // ignore: use_build_context_synchronously
                                Get.off(const DataEntryUser());
                              }
                            }),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
