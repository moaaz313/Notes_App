import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class ShowModelBottomSheet extends StatelessWidget {
  const ShowModelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFormField(hint: 'title'),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormField(
              hint: "content",
              maxline: 5,
            ),
            const SizedBox(
              height: 100,
            ),
            const CustomElevatedButton(),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(double.maxFinite, 55),
            backgroundColor: Colors.green),
        onPressed: () {},
        child: const Text("Add"));
  }
}
