import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes/models/note_model.dart';
part 'display_notes_state.dart';

class DisplayNotesCubit extends Cubit<DisplayNotesState> {
  DisplayNotesCubit() : super(DisplayNotesInitial());
  List<NoteModel>? notes;
  getAllNotes() async {
    var notesBox = Hive.box<NoteModel>('notes_box');
    notes = notesBox.values.toList();
  }
}
