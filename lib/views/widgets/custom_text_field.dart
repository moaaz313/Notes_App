// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key, required this.hint, this.maxline = 1});
  String hint;
  int maxline;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: Colors.greenAccent,
        maxLines: maxline,
        decoration: InputDecoration(
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(Colors.green),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.green),
        ));
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
