import 'package:flutter/material.dart';
import 'package:note_keeper_app/models/note_model.dart';
import 'package:note_keeper_app/utilis/database_helper.dart';
import 'package:note_keeper_app/widgets/showSnackbar.dart';
import 'package:sqflite/sqflite.dart';

// delete note
void delete(
    BuildContext context, NoteModel note, DatabaseHelper databaseHelper) async {
  int result = await databaseHelper.deleteNote(note.id);
  if (result != 0) {
    showSnackBar(context, 'Note Deleted Successfully');
  }
}
// delete note end



