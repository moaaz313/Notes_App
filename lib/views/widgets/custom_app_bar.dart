// ignore_for_file: use_super_parameters


import 'package:flutter/material.dart';

import 'custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key,
      required this.title,
      required this.icon,
      this.onPressed,
      required this.isBack,
      required this.isIcon 
      , required this.x})
      : super(key: key);

  final String title;
  final IconData icon;
  final void Function()? onPressed;
  final void Function()? x;
  final bool isBack, isIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: x,
          icon: Icon(
            isBack ? Icons.arrow_back : Icons.notes,
            size: 25,
          ),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        const Spacer(),
        CustomIcon(
          isIcon: isIcon,
          onPressed: onPressed,
          icon: icon,
        ),
      ],
    );
  }
}
