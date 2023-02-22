import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text, text1;
  final Function() function;
  const CustomText({
    super.key,
    required this.text,
    required this.text1,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1),
        const SizedBox(
          width: 6,
        ),
        InkWell(
            onTap: function,
            child: Text(
              text,
              style: const TextStyle(color: Colors.blue),
            )),
      ],
    );
  }
}
