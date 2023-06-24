import 'package:didit/models/todo.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../data/constants.dart';
import 'package:hive_flutter/adapters.dart';


class TaskData with ChangeNotifier {

  static const boxName = "todos";
  final Box<Todo> box = Hive.box<Todo>(boxName);

  /// Add new Task
  Future<void> addTask({required Todo todo}) async {
    await box.put(todo.id, todo);
  }

  /// Show task
  Future<Todo?> getTask({required String id}) async {
    return box.get(id);
  }

  /// Update task
  Future<void> updateTask({required Todo todo}) async {
    await todo.save();
  }

  /// Delete task
  Future<void> dalateTask({required Todo todo}) async {
    await todo.delete();
  }

  // ValueListenable<Box<Todo>> listenToTask() {
  //   return box.listenable();
  // }

  List _items = [];

  List get items {
    return [..._items];
  }

  Todo? getNote(int? id) {
    return _items.firstWhere((note) => note.id == id, orElse: () => null);
  }

  Future deleteNote(int? id) async {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
    // return DatabaseHelper.delete(id);
  }

  Future getNotes() async {
    // final noteList = await (DatabaseHelper.getNotedFromDb() as Future<List<Map<String, dynamic>>>);

    // _items = noteList
    //     .map((item) => Todo(item['id'],item['todo'], item['color'],
    //        item['done']))
    //     .toList();

    notifyListeners();
  }

  Future addOrUpdateNote(int id, String todoText, 
      String color, bool done,EditMode editMode) async {
    var todo ="";
if (EditMode.ADD == editMode) {
      _items.insert(0, todo);
    } else {
      _items[_items.indexWhere((note) => note.id == id)] = todo;
    }
   
 
    notifyListeners();

    // DatabaseHelper.insert({
    //   'id': todo.id,
    //   'todo': todo.todo,
    //   'date': todo.date,
    //   'color': todo.color,
    //   'done': todo.done
    // });
  }
}