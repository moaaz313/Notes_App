import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';

import 'widgets/edit_note_view.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteView(
        note: note,
      ),
    );
  }
}
