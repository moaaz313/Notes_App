// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key, required this.hint, this.maxline = 1, this.onSaved});
  String hint;
  int maxline;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Field is required';
          } else {
            return null;
          }
        },
        onSaved: onSaved,
        cursorColor: Colors.greenAccent,
        maxLines: maxline,
        decoration: InputDecoration(
          errorBorder: buildBorder(Colors.redAccent),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(Colors.blueGrey),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.blueGrey),
        ));
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
