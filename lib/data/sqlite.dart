import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Future database() async {
    final databasePath = await getDatabasesPath();

    return openDatabase(join(databasePath, 'tasks_database.db'),
        onCreate: (database, version) {
      return database.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY, todo TEXT,  color TEXT, done BIT , date TEXT)');
    }, version: 1);
  }

  static Future insert(Map<String, Object?> data) async {
    final database = await DatabaseHelper.database();
    database.insert("tasks", data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getNotedFromDb() async {
    final database = await DatabaseHelper.database();
    return database.query("tasks", orderBy: "id DESC");
  }

  static Future delete(int? id) async {
    final database = await DatabaseHelper.database();
    return database.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}