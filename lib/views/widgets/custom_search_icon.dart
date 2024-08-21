// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  CustomIcon({super.key, required this.icon, this.onPressed});
  IconData? icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      width: 41,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(0.05)),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 22,
        ),
      ),
    );
  }
}
