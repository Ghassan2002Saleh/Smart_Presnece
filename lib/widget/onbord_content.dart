import 'package:flutter/material.dart';

class OnbordContent extends StatelessWidget {
  const OnbordContent({
    Key? key,
    required this.image,
    required this.title,
    required this.sup,
  }) : super(key: key);
  final String image, title, sup;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          image,
          height: 250,
          width: 200,
        ),
        Spacer(),
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Theme.of(context).primaryColor),
        ),
        Padding(padding: EdgeInsets.only(top: 15)),
        Text(
          sup,
          textAlign: TextAlign.center,
        ),
        Spacer(),
      ],
    );
  }
}
