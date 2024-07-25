// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  CustomSearchIcon({super.key , required this.icon});
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      width: 41,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(0.05)),
      child: IconButton(
        onPressed: () {},
        icon:  Icon(
          icon,
          size: 22,
        ),
      ),
    );
  }
}
