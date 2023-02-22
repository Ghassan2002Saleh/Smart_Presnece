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
import 'package:smart_presence_app/widget/button.dart';
import 'package:smart_presence_app/widget/text_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'bottom_navigation_bar_user.dart';

class DataEntryUser extends StatefulWidget {
  const DataEntryUser({super.key});

  @override
  State<DataEntryUser> createState() => _DataEntryUserState();
}

class _DataEntryUserState extends State<DataEntryUser> {
  Reference? ref;
  File? file;
  late String name, college, imageurl;
  late int rand;

  CollectionReference entryref =
      FirebaseFirestore.instance.collection("data entry user");
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String uid = FirebaseAuth.instance.currentUser!.uid;
  Future dataEntry(context) async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();

      if (file != null) {
        await ref!.putFile(file!);
        imageurl = await ref!.getDownloadURL();
        await entryref.add({
          "name": name,
          "college": college,
          "imageurl": imageurl,
          "userid": uid,
        });
      } else {
        await entryref.add({
          "name": name,
          "college": college,
          "imageurl": "null",
          "userid": uid,
        });
      }

      Get.to(const BottomNavigationBarUser());
      sharedpref?.setString("entry", uid);
    }
    // AwesomeDialog(
    //         dialogBackgroundColor: Theme.of(context).primaryColor,
    //         context: context,
    //         title: "error",
    //         body: const Padding(
    //           padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
    //           child: Text("Please Choose Image"),
    //         ),
    //         dialogType: DialogType.error)
    //     .show();
  }

  @override
  Widget build(BuildContext context) {
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
                          if (value!.length <= 3) {
                            return 'الاسم اقل من 3';
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
                          if (value!.length <= 3) {
                            return 'الاسم اقل من 3';
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
