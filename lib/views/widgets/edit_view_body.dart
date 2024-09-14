// ignore_for_file: use_super_parameters, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/display_notes_cubit.dart';
import '../../models/note_model.dart';
import 'custom_app_bar.dart';
import 'custom_text_field.dart';
import 'edit_note_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                x: () {
                  Navigator.pop(context);
                },
                isIcon: true,
                isBack: true,
                onPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subTitle = content ?? widget.note.subTitle;
                  widget.note.save(); // Save the note in the database
                  BlocProvider.of<DisplayNotesCubit>(context)
                      .getAllNotes(); // Refresh notes list

                  Navigator.pop(
                      context, widget.note); // Return the updated note
                },
                title: 'Edit Note',
                icon: Icons.check,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextField(
                onChanged: (value) {
                  title = value;
                },
                initialValue: widget.note.title,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                onChanged: (value) {
                  content = value;
                },
                initialValue: widget.note.subTitle,
                maxLines: 5,
              ),
              const SizedBox(
                height: 16,
              ),
              EditNoteColorsList(
                note: widget.note,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
