import 'package:didit/models/todo.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../data/constants.dart';
import 'package:hive_flutter/adapters.dart';


class TaskData with ChangeNotifier {

  static const boxName = "todos";
 var hiveBox = Hive.box(boxName);
  var fuid = "";
   addTodo(Todo todo) async {
    var todoMap = todo.toJson();
    await hiveBox.put(fuid, todoMap);
  }

  updateTodo(Todo todo) async {
   var todoMap = todo.toJson();
    await hiveBox.put(fuid, todoMap);
  }

  Future<Todo?> getTodo() async {
    Todo? todo;
    try {
      if (fuid != null && fuid != "") {
        
        var todoMap = hiveBox.get(fuid);
        if (todoMap != null) {
          todo = Todo.fromJson(todoMap);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return todo;
  }

  deleteTodo() async {
   await hiveBox.delete(fuid);
  }
  
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