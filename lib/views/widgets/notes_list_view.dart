// ignore_for_file: use_super_parameters, depend_on_referenced_packages, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubit/display_notes_cubit.dart';
import '../../models/note_model.dart';
import 'note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  _NotesListViewState createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayNotesCubit, DisplayNotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<DisplayNotesCubit>(context).notes ?? [];
        if (notes.isNotEmpty) {
          return Padding(
            padding:
                const EdgeInsetsDirectional.only(top: 10, start: 7, end: 7),
            child: ListView.builder(
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return NoteItem(
                  note: notes[index],
                );
              },
            ),
          );
        } else {
          // Display animated image when no notes are available
          return Center(
            child: FadeTransition(
              opacity: _animation,
              child: Image.asset("assets/svgs/home.png"),
            ),
          );
        }
      },
    );
  }
}
