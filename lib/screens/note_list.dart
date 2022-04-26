import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_keeper_app/screens/note_detail.dart';
import 'package:note_keeper_app/widgets/floating_action_btn.dart';
import 'package:note_keeper_app/widgets/title_bar.dart';

import '../widgets/note_list_card.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        controller: ScrollController(),
        physics: BouncingScrollPhysics(),
        child: Padding(
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
              noteList(
                onClick: () {
                  navigateDetails(title: 'Edit Note');
                },
                color: Color(0xffFD99FF),
                noteText: 'UI Concepts Worth Existing',
              ),
              SizedBox(
                height: 15,
              ),
              noteList(
                onClick: () {
                  navigateDetails(title: 'Edit Note');
                },
                color: Color(0xffFF9E9E),
                noteText:
                    'Book Review : The Design of Everyday Things by Don Norman',
              ),
              SizedBox(
                height: 15,
              ),
              noteList(
                onClick: () {
                  navigateDetails(title: 'Edit Note');
                },
                color: Color(0xff91F48F),
                noteText: 'Animes produced by Ufotable',
              ),
              SizedBox(
                height: 15,
              ),
              noteList(
                onClick: () {
                  navigateDetails(title: 'Edit Note');
                },
                color: Color(0xffFFF599),
                noteText: 'Mangas planned to read',
              ),
              SizedBox(
                height: 15,
              ),
              noteList(
                onClick: () {
                  navigateDetails(title: 'Edit Note');
                },
                color: Color(0xff9EFFFF),
                noteText: 'Awesome tweets collection',
              ),
              SizedBox(
                height: 15,
              ),
              noteList(
                onClick: () {
                  navigateDetails(title: 'Edit Note');
                },
                color: Color(0xffB69CFF),
                noteText: 'List of free & open source apps',
              ),
              // notelist ended here
            ],
          ),
        ),
      ),
      // go to add note page
      floatingActionButton: addedTask(
        taskButtonToolTip: 'Go to add note',
        onpressed: () {
          navigateDetails(title: 'Add Note');
        },
      ),
    );
  }
 
  // navigate to note detail page
  void navigateDetails({required String title}) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NoteDetail(title),
        ),
      );
}
