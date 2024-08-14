// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/widgets.dart';
import 'package:notes/cubit/display_notes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/note_model.dart';
import 'note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayNotesCubit, DisplayNotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<DisplayNotesCubit>(context).notes ?? [];
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
            return NoteItem(
              note: notes[index],
              onPress: () {
                note.delete();
                setState(() {
                  BlocProvider.of<DisplayNotesCubit>(context).getAllNotes();
                });
              },
            );
          },
        );
      },
    );
  }
}
