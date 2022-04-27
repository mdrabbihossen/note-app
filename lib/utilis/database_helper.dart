// import 'dart:io';

// import 'package:note_keeper_app/models/notes.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   static late DatabaseHelper databaseHelper;
//   static late Database _database;
//   String noteTable = "note_table";
//   String colId = "id";
//   String colTitle = "title";
//   String colDescription = "desc";
//   String colPriority = "priority";
//   String colDate = "date";
//   DatabaseHelper.createInstance();
//   factory DatabaseHelper() {
//     // ignore: unnecessary_null_comparison
//     if (databaseHelper == null) {
//       databaseHelper = DatabaseHelper.createInstance();
//     }

//     return databaseHelper;
//   }

//   // get database
//   Future<Database> get database async {
//     // ignore: unnecessary_null_comparison
//     if (_database == null) {
//       _database = await initiaLizeDataBase();
//     }
//     return database;
//   }

//   // create Database
//   void createDB(Database db, int newVersion) async {
//     await db.execute(
//         'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDescription TEXT, $colPriority INTEGER, $colDate TEXT)');
//   }

//   // initialize database
//   Future<Database> initiaLizeDataBase() async {
//     // get the directory path
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = directory.path + 'notes.db';

//     // open/create database
//     var notesDB = await openDatabase(path, version: 1, onCreate: createDB);
//     return notesDB;
//   }

//   // Get all note object to database
//   Future<List<Map<String, dynamic>>> getNoteMapList() async {
//     Database db = await this.database;
//     var result = await db.query(noteTable, orderBy: '$colPriority ASC');
//     return result;
//   }

//   // Insert a note object to database
//   Future<int> insertNote(Notes note) async {
//     Database db = await this.database;
//     var result = await db.insert(noteTable, note.toMap());
//     return result;
//   }

//   // Update a note object to database
//   Future<int> updateNote(Notes note) async {
//     Database db = await this.database;
//     var result = await db.update(noteTable, note.toMap());
//     return result;
//   }

//   // Delete a note object to database
//   Future<int> deleteNote(int id) async {
//     Database db = await this.database;
//     var result = await db.delete('Delete from $noteTable where $colId = $id');
//     return result;
//   }

//   // get number of note objects in database
//   Future<int> getCount() async {
//     Database db = await this.database;
//     List<Map<String, dynamic>> x =
//         await db.rawQuery('SELECT COUNT (*) from $noteTable');
//     int? result = Sqflite.firstIntValue(x);
//     return result!;
//   }
// }
