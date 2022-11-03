import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_keeper_app/constants/constants.dart';
import 'package:note_keeper_app/views/note/screens/note_list_screen.dart';

void main() async {
  await Hive.initFlutter();
  // open the box
  var box = await Hive.openBox('notes');
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
