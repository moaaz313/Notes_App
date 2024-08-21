// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.icon,
      this.isBack = false,
       this.onPress});
  final String title;
  final IconData? icon;
  final bool isBack;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isBack
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back))
            : Container(),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        CustomIcon(
          onPressed: onPress,
          icon: icon,
        ),
      ],
    );
  }
}
