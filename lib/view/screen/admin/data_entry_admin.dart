import 'dart:io';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:smart_presence_app/main.dart';
import 'package:smart_presence_app/view/screen/user/bottom_navigation_bar_user.dart';
import 'package:smart_presence_app/widget/button.dart';
import 'package:smart_presence_app/widget/dialog.dart';
import 'package:smart_presence_app/widget/text_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataEntryAdmin extends StatefulWidget {
  const DataEntryAdmin({super.key});

  @override
  State<DataEntryAdmin> createState() => _DataEntryAdminState();
}

class _DataEntryAdminState extends State<DataEntryAdmin> {
  late Reference ref;
  late File file;
  late int rand;

  @override
  Widget build(BuildContext context) {
    late String name, college, imageurl;

    CollectionReference entryref =
        FirebaseFirestore.instance.collection("data");
    GlobalKey<FormState> formstate = GlobalKey<FormState>();

    Future dataEntry(context) async {
      // if (file == null) {
      //   AwesomeDialog(
      //           context: context,
      //           title: "error",
      //           body: const Text("Please Choose Image"),
      //           dialogType: DialogType.error)
      //       .show();
      // }
      var formdata = formstate.currentState;

      if (formdata!.validate()) {
        ShowDialogPage(context);
        formdata.save();
        if (file != null) {
          await ref.putFile(file);
          imageurl = await ref.getDownloadURL();
          await entryref.add({
            "name": name,
            "college": college,
            "imageurl": imageurl,
            "userid": FirebaseAuth.instance.currentUser!.uid,
          });
        } else {
          await entryref.add({
            "name": name,
            "college": college,
            "userid": FirebaseAuth.instance.currentUser!.uid,
          });
        }
        sharedpref?.setString("entry", name);
        Get.to(const BottomNavigationBarUser());
      }
      AwesomeDialog(
              dialogBackgroundColor: Theme.of(context).primaryColor,
              context: context,
              title: "error",
              body: const Padding(
                padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
                child: Text("Please Choose Image"),
              ),
              dialogType: DialogType.error)
          .show();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: ListView(
            padding: const EdgeInsets.all(0.0),
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, bottom: 10, top: 20),
                child: Form(
                  key: formstate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "تعبئة البيانات",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextForm(
                        titleText: "الاسم كامل ",
                        hintText: "الاسم",
                        onSaved: (val) {
                          name = val!;
                        },
                        validator: (value) {
                          if (value!.length > 30) {
                            return "البريد أكبر من 30";
                          }
                          if (value.length < 5) {
                            return "البريد أقل من 5";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextForm(
                        titleText: "الكلية عربي",
                        hintText: "الكلية",
                        onSaved: (val) {
                          college = val!;
                        },
                        validator: (value) {
                          if (value!.length > 30) {
                            return "البريد أكبر من 30";
                          }
                          if (value.length < 5) {
                            return "البريد أقل من 5";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "ارفاق صورة",
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
                          onPressed: () {
                            ShowBottomSheet(context);
                          },
                          child: const Text("اضافة صورة")),
                      const SizedBox(
                        height: 40,
                      ),
                      Button(
                          text: "تسجيل",
                          function: () {
                            dataEntry(context);
                          })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ShowBottomSheet(context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(20),
            height: 100,
            child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: InkWell(
                        child: Column(
                          children: const [
                            Icon(Icons.photo),
                            Text("gallery"),
                          ],
                        ),
                        onTap: () async {
                          var picked = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (picked != null) {
                            file = File(picked.path);
                            rand = Random().nextInt(100000000);
                            String imagename = "$rand" + basename(picked.path);
                            ref = FirebaseStorage.instance
                                .ref("images/$imagename");
                            Navigator.of(context).pop();
                          }
                        }),
                  ),
                  const SizedBox(width: 150),
                  InkWell(
                    child: Column(
                      children: const [
                        Icon(Icons.camera),
                        Text("camera"),
                      ],
                    ),
                    onTap: () async {
                      var picked = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      if (picked != null) {
                        file = File(picked.path);
                        rand = Random().nextInt(100000000);
                        String imagename = "$rand" + basename(picked.path);
                        ref = FirebaseStorage.instance.ref("images/$imagename");
                        Navigator.of(context).pop();
                      }
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
