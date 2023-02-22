import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Function() function;
  final Color color;
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.function,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: function,
        child: Icon(
          icon,
          size: 25,
          color: color,
        ));
  }
}
