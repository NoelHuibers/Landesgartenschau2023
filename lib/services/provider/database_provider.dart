import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '/models/events/happening.dart';
import '/models/stands/stand.dart';

class DatabaseProvider {
  static Database? _database;
  static final DatabaseProvider instance = DatabaseProvider._init();

  DatabaseProvider._init();

  Future<Database> get database async {
    // If the database is created, return it
    if (_database != null) return _database!;

    // Else, create the database
    _database = await _initDB('lgs2023.db');

    return _database!;
  } // get the database

  Future<Database> _initDB(String filePath) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, filePath);

    return await openDatabase(path, version: 1, onCreate: _creatDatabase);
  } // initialize a database

  Future _creatDatabase(Database db, int version) async {
    const idx = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const text = 'TEXT NOT NULL';
    const integer = 'INTEGER NOT NULL';

    await db.execute('''
      CREATE TABLE $tableHappenings (
        ${HappeningFields.id} $idx,
        ${HappeningFields.name} $text,
        ${HappeningFields.description} $text,
        ${HappeningFields.startdate} $text,
        ${HappeningFields.enddate} $text,
        ${HappeningFields.areaId} $integer
      )''');
    await db.execute('''
      CREATE TABLE $tableStands (
        ${StandsFields.id} $idx,
        ${StandsFields.name} $text,
        ${StandsFields.description} $text,
        ${StandsFields.latitude} $integer,
        ${StandsFields.longitude} $integer,
        ${StandsFields.standCategory} $text,
        ${StandsFields.standCategoryId} $integer
      )'''); // create a table
  } // create a database

  Future<Happening> createHappening(Happening newHappening) async {
    final db = await instance.database;
    final id = await db.insert(tableHappenings, newHappening.toJson());

    return newHappening.copy(id: id);
  } // Creating a new happening

  updateAllHappenings(List<Happening> newHappenings) async {
    final db = await instance.database;
    instance.deleteAllHappenings();
    for (Happening newHappening in newHappenings) {
      final id = await db.insert(tableHappenings, newHappening.toJson());
      newHappening.copy(id: id);
    }
  } // Creating multiple happenings

  Future<Happening> getHappening(int id) async {
    final db = await instance.database;
    final res = await db.query(tableHappenings,
        where: '${HappeningFields.id} = ?', whereArgs: [id]);

    if (res.isNotEmpty) {
      return Happening.fromJsonDB(res.first);
    } else {
      throw Exception('ID $id not found');
    } //Throw an exception if the id is not found
  } // Getting a happening by ID

  Future<List<Happening>> getAllHappenings() async {
    final db = await instance.database;
    final res = await db.query(tableHappenings);
    List<Happening> list =
        res.map((json) => Happening.fromJsonDB(json)).toList();

    if (list.isNotEmpty) {
      return list;
    } else {
      throw Exception('Table is empty');
    } // If table is empty, throw exception
  } // Get all happenings from database

  Future<int> deleteHappening(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableHappenings,
      where: '${HappeningFields.id} = ?',
      whereArgs: [id],
    );
  } // Delete happening from database

  Future<int> deleteAllHappenings() async {
    final db = await database;
    return await db.delete(tableHappenings);
  } // Delete all happenings from database

  Future<Stand> createStand(Stand newStand) async {
    final db = await instance.database;
    final id = await db.insert(tableStands, newStand.toJson());

    return newStand.copy(id: id);
  } // Creating a new stand

  updateAllStands(List<Stand> newStands) async {
    final db = await instance.database;
    instance.deleteAllStands();
    for (Stand newStand in newStands) {
      final id = await db.insert(tableStands, newStand.toJson());
      newStand.copy(id: id);
    }
  } // Creating multiple stands

  Future<Stand> getStand(int id) async {
    final db = await instance.database;
    final res = await db.query(
      tableStands,
      where: '${StandsFields.id} = ?',
      whereArgs: [id],
    );

    if (res.isNotEmpty) {
      return Stand.fromJsonDB(res.first);
    } else {
      throw Exception('ID $id not found');
    } //Throw an exception if the id is not found
  } // Getting a stand by ID

  Future<List<Stand>> getAllStands() async {
    final db = await instance.database;
    final res = await db.query(tableStands);
    List<Stand> list = res.map((json) => Stand.fromJsonDB(json)).toList();

    if (list.isNotEmpty) {
      return list;
    } else {
      throw Exception('Table is empty');
    } // If table is empty, throw exception
  } // Get all stands from database

  Future<int> deleteStand(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableStands,
      where: '${StandsFields.id} = ?',
      whereArgs: [id],
    );
  } // Delete stand from database

  Future<int> deleteAllStands() async {
    final db = await database;
    return await db.delete(tableStands);
  } // Delete all stands from database

  Future close() async {
    final db = await instance.database;

    db.close();
  } // Close database
}
