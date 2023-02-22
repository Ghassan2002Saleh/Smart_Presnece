import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function() function;
  final Color color;
  Button({
    super.key,
    required this.text,
    required this.function,
    this.color = const Color.fromARGB(255, 149, 117, 205),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(16)),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        )),
      ),
    );
  }
}
