import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String text;
  Icon icon;
  Widget suffixIcon;
  TextInputType textInputType;
  bool obscureText;
  TextEditingController controller;

  CustomTextField({
    super.key,
    required this.text,
    required this.icon,
    required this.textInputType,
    this.obscureText = false,
    this.suffixIcon = const SizedBox(
      width: 1,
    ),
    required this.controller,
  });

  // ghsansalh47@gmail.com
  // gh20191647

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: widget.controller,
          keyboardType: widget.textInputType,
          obscureText: widget.obscureText,
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: widget.icon,
              prefixIconColor: Theme.of(context).primaryColor,
              suffixIcon: widget.suffixIcon,
              suffixIconColor: Theme.of(context).primaryColor,
              border: buildBorder(),
              enabledBorder: buildBorder(),
              focusedBorder: buildBorder(Theme.of(context).primaryColor)),
        ),
      ],
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: color ?? Theme.of(context).primaryColor));
  }
}
