import 'package:flutter/material.dart';

import 'custom_app_bar.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
          ],
        ),
      ),
    );
  }
}
