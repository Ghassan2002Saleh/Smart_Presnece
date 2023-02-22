import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          "smart".tr,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Opacity(
          opacity: 0.25,
          child: Image.asset(
            "images/fingerprint.png",
            width: 50,
            height: 70,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
