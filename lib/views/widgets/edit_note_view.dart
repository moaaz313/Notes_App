// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:notes/cubit/display_notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_app_bar.dart';
import 'custom_text_field.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          CustomAppBar(
            onPress: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.subTitle;
              widget.note.save();
              Navigator.pop(context);
              BlocProvider.of<DisplayNotesCubit>(context).getAllNotes();
              setState(() {});
            },
            isBack: true,
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 24,
          ),
          CustomTextFormField(
              onChange: (value) {
                title = value;
              },
              hint: widget.note.title),
          const SizedBox(
            height: 6,
          ),
          CustomTextFormField(
            onChange: (value) {
              content = value;
            },
            hint: widget.note.subTitle,
            maxline: 5,
          ),
        ],
      ),
    ));
  }
}
