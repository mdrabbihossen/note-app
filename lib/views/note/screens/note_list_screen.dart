import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_keeper_app/constants/constants.dart';
import 'package:note_keeper_app/models/data/noteData.dart';

import 'package:note_keeper_app/views/note/screens/note_detail_screen.dart';
import 'package:note_keeper_app/views/note/widgets/floating_action_btn.dart';
import 'package:note_keeper_app/views/note/widgets/note_list_card.dart';

import 'package:note_keeper_app/views/note/widgets/title_bar.dart';
import 'package:note_keeper_app/widgets/title_bar_icons.dart';

class NoteList extends StatefulWidget {
  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            titleBar(),
            SizedBox(height: 10),
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
                itemCount: notes.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: noteList(
                    color: notes[index].color,
                    noteText: notes[index].text,
                    noteDesc: notes[index].desc,
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NoteDetail(
                            'Edit Note',
                          ),
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
          );
        },
      ),
    );
  }

  // navigate to note detail page
  void navigateDetails({
    required String title,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoteDetail(title),
      ),
    );
  }

// update note end
}
