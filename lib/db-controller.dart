import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBUtils {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }
  
  initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE Todo (id INTEGER PRIMARY KEY, text TEXT)');
    });
    return database;
  }

  addInTable(String tableName, int id, String text) async {
    final db = await database;
    var raw = await db.rawInsert('INSERT INTO $tableName (id,text) VALUES (?,?)', [id, text]);
    return raw;
  }

  getTable(String tableName) async {
    final db = await database;
    return await db.query(tableName);
  }
}

var db = DBUtils();