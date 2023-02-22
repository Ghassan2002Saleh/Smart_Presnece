import 'package:flutter/material.dart';

class CustomExisting extends StatelessWidget {
  final String text;
  final Widget icon;
  final Widget widget;
  final double number;
  final bool padding;
  final Color color;
  const CustomExisting({
    super.key,
    required this.text,
    this.icon = const SizedBox(),
    this.widget = const SizedBox(),
    required this.number,
    this.padding = false,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    bool pad = padding;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: pad
            ? const EdgeInsets.symmetric(vertical: 5.0)
            : const EdgeInsets.symmetric(vertical: 0.0),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(number), color: color),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            icon,
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            widget
          ],
        ),
      ),
    );
  }
}
