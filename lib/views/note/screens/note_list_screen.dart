import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_keeper_app/data/noteData.dart';
import 'package:note_keeper_app/models/note_model.dart';
import 'package:note_keeper_app/utilis/database_helper.dart';

import 'package:note_keeper_app/views/note/screens/note_detail_screen.dart';
import 'package:note_keeper_app/views/note/widgets/floating_action_btn.dart';
import 'package:note_keeper_app/views/note/widgets/note_list_card.dart';

import 'package:note_keeper_app/views/note/widgets/title_bar.dart';

import 'package:sqflite/sqflite.dart';

class NoteList extends StatefulWidget {
  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<NoteModel>? mynote;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (mynote == null) {
      mynote = <NoteModel>[];
      updateNoteListView();
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            children: [
              // title bar
              titleBar(),
              SizedBox(
                height: 10,
              ),
              Text(
                'Double click to edit',
                style: GoogleFonts.rajdhani(
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
              SizedBox(height: 30),
              // all the note list here
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 10),
                  itemCount: count,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: noteList(
                      color: notes[index].color,
                      noteText: this.mynote![index].title,
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NoteDetail('Edit Note', this.mynote![index]),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              // notelist ended here
            ],
          ),
        ),
        // go to add note page
        floatingActionButton: addedTask(
          taskButtonToolTip: 'Go to add note',
          onPressed: () {
            navigateDetails(
              title: 'Add Note',
              noteModel: NoteModel(
                0,
                '',
                '',
              ),
            );
          },
        ),
      ),
    );
  }

  // navigate to note detail page
  void navigateDetails({
    required String title,
    required NoteModel noteModel,
  }) async {
    bool result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoteDetail(title, noteModel),
      ),
    );
    if (result == true) {
      updateNoteListView();
    }
  }

// update note
  void updateNoteListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDB();
    dbFuture.then((database) {
      Future<List<NoteModel>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.mynote = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
// update note end
}
