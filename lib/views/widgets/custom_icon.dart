// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(
      {Key? key, required this.icon, this.onPressed, required this.isIcon})
      : super(key: key);

  final void Function()? onPressed;
  final IconData icon;
  final bool isIcon;
  @override
  Widget build(BuildContext context) {
    return isIcon
        ? Container(
            height: 41,
            width: 41,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.05),
                borderRadius: BorderRadius.circular(16)),
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                icon,
                size: 22,
              ),
            ),
          )
        : Container();
  }
}
