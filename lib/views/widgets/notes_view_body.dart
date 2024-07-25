import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: " Note",
              icon: Icons.search,
            ),
            const SizedBox(
              height: 16,
            ),
            // todo > Using Expanded in this line to avoid error because
            const Expanded(child: NotesListView()),
          ],
        ),
      ),
    );
  }
}
