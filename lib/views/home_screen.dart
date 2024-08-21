// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

import 'add_note_bottom_sheet.dart';
import 'widgets/notes_view_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: AddNoteBottomSheet(),
      body: NotesViewBody(),
    );
  }
}
