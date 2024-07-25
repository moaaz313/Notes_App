import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'custom_text_field.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 24,
          ),
          CustomTextFormField(hint: 'Title'),
          const SizedBox(
            height: 6,
          ),
          CustomTextFormField(
            hint: 'Content',
            maxline: 5,
          ),
        ],
      ),
    ));
  }
}
