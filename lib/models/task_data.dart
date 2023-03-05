import 'package:didit/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:didit/data/sqlite.dart';
import 'dart:async';
import 'package:flutter/material.dart';




class TaskData with ChangeNotifier {
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
    return DatabaseHelper.delete(id);
  }

  Future getNotes() async {
    final noteList = await (DatabaseHelper.getNotedFromDb() as FutureOr<List<Map<String, dynamic>>>);

    _items = noteList
        .map((item) => Todo(id:item['id'],todo: item['todo'],color: item['color'],
           date: item['date'],done: item['done']))
        .toList();

    notifyListeners();
  }

  Future addOrUpdateNote(int id, String todoText, DateTime date,
      Color color, bool done,) async {
    final todo = Todo(id: id,todo: todoText,date: date,color: color,done: done);

      _items[_items.indexWhere((todo) => todo.id == id)] = todo;
 
    notifyListeners();

    DatabaseHelper.insert({
      'id': todo.id,
      'todo': todo.todo,
      'date': todo.date,
      'color': todo.color,
      'done': todo.done
    });
  }
}