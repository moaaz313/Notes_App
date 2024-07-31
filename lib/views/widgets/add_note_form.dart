// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:notes/cubit/add_notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'custom_text_field.dart';
import 'elvated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // For BlocProvider

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hint: 'title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextFormField(
            hint: "content",
            maxline: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(
            height: 100,
          ),
          CustomElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var noteModel = NoteModel(
                    date: DateTime.now().toString(),
                    color: Colors.blueGrey.value,
                    subTitle: subTitle!,
                    title: title!);
                BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
              setState(() {});
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
