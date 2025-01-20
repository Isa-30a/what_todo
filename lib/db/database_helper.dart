import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    if (!Platform.isAndroid) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }

    final dbPath = await getDatabasesPath();

    final path = join(dbPath, 'whatTodoDb.db');
    if (kDebugMode) {
      print('Database path: $path');
    }

    try {
      return await openDatabase(
        path,
        version: 1,
        onCreate: _onCreate,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Error opening database: $e');
      }
      rethrow;
    }
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        completed INTEGER NOT NULL
      )
    ''');
  }

  Future<int> insertTask(Map<String, dynamic> task) async {
    final db = await database;
    return await db.insert('tasks', task);
  }

  Future<List<Map<String, dynamic>>> getAllTasks() async {
    final db = await database;
    return await db.query('tasks');
  }

  Future<int> updateTask(Map<String, dynamic> task) async {
    final db = await database;
    return await db.update(
      'tasks',
      task,
      where: 'id = ?',
      whereArgs: [task['id']],
    );
  }

  Future<int> deleteTask(int id) async {
    final db = await database;
    return await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
