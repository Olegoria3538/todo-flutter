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
    //await deleteDatabase(path);
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE $tableName (id INTEGER PRIMARY KEY, text TEXT, isCheck BOOLEAN, time TEXT)');
    });
    return database;
  }

  addInTable(int id, String text, bool isCheck, DateTime? time) async {
    var timeFormat = time?.toIso8601String();
    final db = await database;
    var raw = await db.rawInsert('INSERT INTO $tableName (id,text,isCheck,time) VALUES (?,?,?,?)', [id, text, isCheck, timeFormat]);
    return raw;
  }

  getTable(String tableName) async {
    final db = await database;
    return await db.query(tableName);
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