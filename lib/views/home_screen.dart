import 'package:flutter/material.dart';

import 'widgets/notes_view_body.dart';
import 'widgets/show_bottm_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              context: context,
              builder: (context) {
                return const ShowModelBottomSheet();
              });
        },
        child: const Icon(Icons.edit),
      ),
      body: const NotesViewBody(),
    );
  }
}
