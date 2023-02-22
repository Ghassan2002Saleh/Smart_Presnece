import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String text;
  final Icon icon;
  final Widget suffixIcon;
  final String? Function(String?)? functionvalidator;
  final void Function(String?)? functionsave;
  final TextInputType textInputType;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    required this.text,
    required this.icon,
    required this.functionsave,
    required this.functionvalidator,
    required this.textInputType,
    this.obscureText = false,
    this.suffixIcon = const SizedBox(
      width: 1,
    ),
  });

  // ghsansalh47@gmail.com
  // gh20191647

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
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
        TextFormField(
          keyboardType: widget.textInputType,
          obscureText: widget.obscureText,
          validator: widget.functionvalidator,
          onSaved: widget.functionsave,
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
