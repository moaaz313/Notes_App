// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:notes/views/edit_note_screen.dart';
import '../../models/note_model.dart';
import 'widgets/custom_app_bar.dart';

class NoteDetailView extends StatefulWidget {
  final NoteModel note;

  const NoteDetailView({Key? key, required this.note}) : super(key: key);

  @override
  _NoteDetailViewState createState() => _NoteDetailViewState();
}

class _NoteDetailViewState extends State<NoteDetailView> {
  late NoteModel currentNote;

  @override
  void initState() {
    super.initState();
    currentNote = widget.note; // Initialize with the note passed in
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomAppBar(
            x: () {
              Navigator.pop(context);
            },
            isIcon: true,
            isBack: true,
            title: ' Note Details ',
            icon: Icons.edit,
            onPressed: () async {
              final updatedNote = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditNoteScreen(note: currentNote),
                ),
              );

              // If a note was updated, refresh the UI
              if (updatedNote != null) {
                setState(() {
                  currentNote = updatedNote;
                });
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentNote.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  currentNote.subTitle,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
