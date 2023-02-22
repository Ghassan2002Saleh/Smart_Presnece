import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_presence_app/widget/custom_alertdialog.dart';
import 'package:smart_presence_app/widget/custom_button_body.dart';
import 'package:widget_mask/widget_mask.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference dataref =
      FirebaseFirestore.instance.collection("data entry user");

  var id = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    super.initState();
    print(id);
    print('==============================');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
            child: FutureBuilder(
          future: dataref.where("userid", isEqualTo: "$id").get(),
          builder: (context, snapshot) {
            return BodyData(
              data: snapshot.data?.docs,
            );
          },
        )),
      ),
    );
  }
}

class BodyData extends StatefulWidget {
  final data;
  const BodyData({super.key, this.data});

  @override
  State<BodyData> createState() => _BodyDataState();
}

class _BodyDataState extends State<BodyData> {
  @override
  void initState() {
    // print("${widget.data('name')}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        WidgetMask(
          blendMode: BlendMode.srcATop,
          childSaveLayer: true,
          mask: Image.asset("images/shape.png"),
          child: Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcOycfScEV9t9uJrfvotrEQSNBSngQr25MSw&usqp=CAU",
            width: 100,
          ),
        ),
        // Container(
        //   width: 100,
        //   height: 100,
        //   decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(100),
        //       image: DecorationImage(
        //           image: data['imageurl'] == "null"
        //               ? const NetworkImage(
        //                   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcOycfScEV9t9uJrfvotrEQSNBSngQr25MSw&usqp=CAU")
        //               : NetworkImage("${data['imageurl']}"),
        //           fit: BoxFit.fill)),
        // ),
        const SizedBox(
          height: 20,
        ),
        Text(
          // "${widget.data['name']}",
          "Ghassan",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          // "${data['college']}",
          "Information Technology",
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButtonBody(
                function: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const CustomAlertDialog(
                        text: "هل انت متاكد من تاكيد الانصراف",
                      );
                    },
                  );
                },
                text: "checkout".tr),
            CustomButtonBody(
                function: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const CustomAlertDialog(
                        text: "هل انت متاكد من تاكيد الحضور",
                      );
                    },
                  );
                },
                text: "record".tr),
          ],
        )
      ],
    );
  }
}
