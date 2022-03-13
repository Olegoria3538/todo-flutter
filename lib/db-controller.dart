import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/todo-list-controller.dart';

class DBUtils {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  var tableName = 'Todo';

  initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    // await deleteDatabase(path);
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, text TEXT, isCheck BOOLEAN, time TEXT)');
    });
    return database;
  }

  addInTable(Task task) async {
    var map = task.toMap();
    map["time"] = map["time"]?.toIso8601String();
    map["id"] = null;
    final db = await database;
    var id = await db.insert(tableName, map);
    return id;
  }

  getTable(String tableName) async {
    final db = await database;
    var res = await db.query(tableName);
    return res;
  }

  updateTask(Task task) async {
    final db = await database;
    return await db.update(tableName, task.toMap(), where: "id = ?", whereArgs: [task.id]);
  }

  deleteInTable(int id) async {
    final db = await database;
    return await db.delete(tableName, where: "id = ?", whereArgs: [id]);
  }
}

var db = DBUtils();