import 'package:flutter/material.dart';
import 'package:smart_presence_app/widget/button.dart';
import 'package:smart_presence_app/widget/text_form.dart';

class EditeShowBottomheet extends StatelessWidget {
  const EditeShowBottomheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 32),
            CustomTextForm(
              titleText: "Title",
              hintText: "",
            ),
            const SizedBox(height: 16),
            CustomTextForm(
              titleText: "Content",
              hintText: "",
            ),
            const SizedBox(
              height: 32,
            ),
            Button(
              function: () {},
              text: "",
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
