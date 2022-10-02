import 'dart:io';

import 'package:note_keeper_app/models/note_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? databaseHelper;
  static Database? _database;
  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colDate = 'date';
  String colPriority = 'priority';

  DatabaseHelper.createInstance();

  factory DatabaseHelper() {
    if (databaseHelper == null) {
      databaseHelper = DatabaseHelper.createInstance();
    }

    return databaseHelper!;
  }

  // get database
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDB();
    }
    return _database!;
  }

  // initialize database
  Future<Database> initializeDB() async {
    // get the directory path for both android and ios to store database
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: createDB);
    return notesDatabase;
  }

  // initialize database end
  // create database
  void createDB(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDescription TEXT, $colDate TEXT, $colPriority INTEGER)');
  }

// create database end

// fetch note object from database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;
    var result = await db.query(noteTable, orderBy: '$colPriority ASC');
    return result;
  }

// fetch note object from database end

// insert note
  Future<int> insertNote(NoteModel note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

// insert note end

  // update note
  Future<int> updateNote(NoteModel note) async {
    Database db = await this.database;
    var result = await db.update(noteTable, note.toMap(),
        where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

// update note end

  // delete note
  Future<int> deleteNote(int id) async {
    Database db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    return result;
  }

// delete note end

// get number of note object in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> value =
        await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int result = Sqflite.firstIntValue(value)!;
    return result;
  }
// get number of note object in database end
}
