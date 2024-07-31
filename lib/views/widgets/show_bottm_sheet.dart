// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:flutter/material.dart';
import 'package:notes/cubit/add_notes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_note_form.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ShowModelBottomSheet extends StatelessWidget {
  const ShowModelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: BlocConsumer<AddNotesCubit, AddNotesState>(
          listener: (context, state) {
            if (state is AddNotesFailuer) {
              print('failed ${state.errMessage}');
            }
            if (state is AddNotesSuccess) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is AddNotesLoading ? true : false,
                child: const SingleChildScrollView(child: AddNoteForm()));
          },
        ),
      ),
    );
  }
}
