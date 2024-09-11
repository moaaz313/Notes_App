// ignore_for_file: use_super_parameters, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubit/display_notes_cubit.dart';

import '../../models/note_model.dart';
import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayNotesCubit, DisplayNotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<DisplayNotesCubit>(context).notes ?? [];
        if (notes.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: NoteItem(
                    note: notes[index],
                  ),
                );
              },
            ),
          );
        } else {
          // Display image when no notes are available
          return Center(
            child: Image.asset("assets/svgs/home.png"),
          );
        }
      },
    );
  }
}
