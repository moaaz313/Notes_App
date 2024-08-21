// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:notes/cubit/display_notes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<DisplayNotesCubit>(context).getAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: " Note",
              icon: Icons.search,
            ),
            SizedBox(
              height: 16,
            ),
            // todo > Using Expanded in this line to avoid error because
            Expanded(child: NotesListView()),
          ],
        ),
      ),
    );
  }
}
