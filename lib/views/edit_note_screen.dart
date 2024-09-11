import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/edit_view_body.dart';


class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(
        note: note,
      ),
    );
  }
}
