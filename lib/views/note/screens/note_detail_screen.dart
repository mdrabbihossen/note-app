import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_keeper_app/constants/constants.dart';

import 'package:note_keeper_app/views/note/widgets/floating_action_btn.dart';
import 'package:note_keeper_app/views/note/widgets/task_button.dart';

import 'package:note_keeper_app/widgets/add_task_field.dart';


class NoteDetail extends StatefulWidget {

  final String appBarTitle;

  NoteDetail(this.appBarTitle);

  @override
  State<NoteDetail> createState() => _NoteDetailState(this.appBarTitle);
}

class _NoteDetailState extends State<NoteDetail> {
  String? appBarTitle;

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  _NoteDetailState(this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // go to previous page
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 15, top: 10, bottom: 10, right: 8),
                        decoration: BoxDecoration(
                          color: Color(0xff252525),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      appBarTitle.toString(),
                      style: GoogleFonts.montserrat(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/add_note.png',
                width: 400,
                height: 300,
              ),
              Center(
                child: Text(
                  '$appBarTitle here!',
                  style: GoogleFonts.raleway(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(height: size.height * 0.2),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 20),
                child: Text(
                  'Click here to ${appBarTitle}',
                  style: GoogleFonts.indieFlower(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Image.asset(
                  'assets/images/arrow.png',
                  height: 100,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: addedTask(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              backgroundColor: backgroundColor.withOpacity(0.9),
              context: context,
              builder: (context) => AddNote(),
            );
          },
          taskButtonToolTip: 'Add Task',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  // bottom sheet where add or edit note
  Widget AddNote() => DraggableScrollableSheet(
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
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.5),
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
                    onClick: () {},
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  // delete button
                  taskButton(
                    color: Color(0xffFF0000),
                    buttonText: 'Delete',
                    onClick: () {},
                  )
                ],
              ),
            ],
          ),
        ),
      );
}
