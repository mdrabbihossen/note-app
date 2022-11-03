import 'package:hive/hive.dart';
import 'package:note_keeper_app/models/data/noteData.dart';

class TODODatabase {
  List todoList = [];

  // reference our box
  final noteBox = Hive.box('notes');

  // create init data

  void createInitData() {
    todoList = notes.length == 0 ? [] : notes;
  }

  // load the data from database
  void loadData() {
    todoList = noteBox.get('TODOLIST');
  }

  // update the data
  void updateData() {
    noteBox.put('TODOLIST', todoList);
  }

  // delete the data
  void deleteData(int index) {
    todoList.removeAt(index);
    updateData();
  }
}
