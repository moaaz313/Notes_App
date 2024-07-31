// ignore_for_file: depend_on_referenced_packages, unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes/models/note_model.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  addNote(NoteModel note) async {
    emit(AddNotesLoading());
    try {
      var notesBox = Hive.box<NoteModel>('notes_box');
      emit(AddNotesSuccess());
      await notesBox.add(note);
    } catch (errMessage) {
      emit(AddNotesFailuer(errMessage.toString()));
    }
  }
}
