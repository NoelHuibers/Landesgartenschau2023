import 'dart:io';
import '/models/happenings.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static late Database _database;
  static final DatabaseProvider db = DatabaseProvider._();

  DatabaseProvider._();

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'happenings.db');

    return await openDatabase(path, version: 0, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Happening('
          'id INTEGER PRIMARY KEY,'
          'name TEXT,'
          'description TEXT,'
          'date TEXT,'
          ')');
    });
  }

  // Insert happenings on database
  createHappening(Happening newHappening) async {
    await deleteAllHappenings();
    final db = await database;
    final res = await db.insert('Happening', newHappening.toJson());

    return res;
  }

  createAllHappenings(List<Happening> newHappenings) async {
    await deleteAllHappenings();
    final db = await database;
    for (var happening in newHappenings) {
      await db.insert('Happening', happening.toJson());
    }
  }

  // Delete all happenings from database
  Future<int> deleteAllHappenings() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Happening');

    return res;
  }

  Future<List<Happening>> getAllHappenings() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Happening");

    List<Happening> list =
        res.isNotEmpty ? res.map((c) => Happening.fromJson(c)).toList() : [];

    return list;
  }
}
