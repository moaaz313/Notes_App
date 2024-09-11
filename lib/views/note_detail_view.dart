// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:notes/views/edit_note_screen.dart';
import '../../models/note_model.dart';

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
      appBar: AppBar(
        title: const Text('Note Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              // Navigate to edit screen and wait for result
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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentNote.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
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
    );
  }
}
