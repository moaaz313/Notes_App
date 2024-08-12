// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:notes/cubit/display_notes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/notes_view_body.dart';
import 'widgets/show_bottm_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DisplayNotesCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                context: context,
                builder: (context) {
                  return const ShowModelBottomSheet();
                });
          },
          child: const Icon(Icons.edit),
        ), 
        body: const NotesViewBody(),
      ),
    );
  }
}
