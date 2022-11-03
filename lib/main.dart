import 'package:flutter/material.dart';
import 'package:note_keeper_app/constants/constants.dart';
import 'package:note_keeper_app/views/note/screens/note_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: NoteList(),
    );
  }
}
