import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String titleText, hintText;
  final int line1, line2;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  const CustomTextForm(
      {super.key,
      required this.titleText,
      required this.hintText,
      this.line1 = 1,
      this.line2 = 1,
      this.onSaved,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          onSaved: onSaved,
          validator: validator,
          minLines: line1,
          maxLines: line2,
          cursorColor: Theme.of(context).primaryColor,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
              hintText: hintText,
              // filled: true,
              // fillColor: Colors.white,
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).primaryColor))),
        ),
      ],
    );
  }
}
