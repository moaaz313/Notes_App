import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.onPressed, this.isLoading = false});
  final bool isLoading;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(double.maxFinite, 55),
            backgroundColor: Colors.green),
        onPressed: onPressed,
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.black,
              )
            : const Text('Add'));
  }
}
