import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:note_keeper_app/constants/constants.dart';
import 'package:note_keeper_app/models/data/noteData.dart';
import 'package:note_keeper_app/utilis/database_helper.dart';

import 'package:note_keeper_app/views/note/screens/note_detail_screen.dart';
import 'package:note_keeper_app/views/note/widgets/floating_action_btn.dart';
import 'package:note_keeper_app/views/note/widgets/note_list_card.dart';
import 'package:note_keeper_app/views/note/widgets/task_button.dart';

import 'package:note_keeper_app/views/note/widgets/title_bar.dart';
import 'package:note_keeper_app/widgets/add_task_field.dart';

class NoteList extends StatefulWidget {
  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  // reference the hive box
  final noteBox = Hive.box('notes');
  TODODatabase db = TODODatabase();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  // draggable scrollable controller
  DraggableScrollableController _scrollController =
      DraggableScrollableController();

  @override
  void initState() {
    // if this is the first time opening the app then create the default data
    if (noteBox.get('TODOLIST') == null) {
      db.createInitData();
    } else {
      // already exist data
      db.loadData();
    }
    //  implement initState
    super.initState();
  }

  // save note
  void saveNote() {
    setState(() {
      db.todoList.add(
        NoteData(
          text: titleController.text,
          desc: descController.text,
          color: db.todoList.length == 0
              ? Color(0xffFD99FF)
              : db.todoList[db.todoList.length - 1].color,
        ),
      );
      titleController.clear();
      descController.clear();
    });
    Navigator.pop(context);
    db.updateData();
  }

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
                itemCount: db.todoList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: noteList(
                    color: db.todoList[index].color,
                    noteText: db.todoList[index].text,
                    noteDesc: db.todoList[index].desc,
                    onDelete: (context) {
                      setState(() {
                        db.todoList.removeAt(index);
                      });
                      db.updateData();
                    },
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
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            backgroundColor: kBackgroundColor.withOpacity(0.9),
            context: context,
            builder: (context) => AddNote(),
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

  Widget AddNote() => DraggableScrollableSheet(
        controller: _scrollController,
        builder: (context, scrollController) => Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: ListView(
            controller: scrollController,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  'Add Your Task From Here!',
                  textAlign: TextAlign.center,
                  style: kTextStyle.copyWith(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // title field
              addTaskField(
                  maxLength: 20,
                  controller: titleController,
                  hintText: 'Title',
                  onChanged: (value) {},
                  fontSize: 28,
                  cursorHeight: 45),
              SizedBox(
                height: 20,
              ),
              // description field
              addTaskField(
                  maxLength: 40,
                  controller: descController,
                  hintText: 'Description...',
                  onChanged: (value) {},
                  fontSize: 17,
                  cursorHeight: 55),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // save button
                  taskButton(
                    color: Color(0xff30BE71),
                    buttonText: 'Save',
                    onClick: () {
                      saveNote();
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  // delete button
                  taskButton(
                    color: Color(0xffFF0000),
                    buttonText: 'Delete',
                    onClick: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
