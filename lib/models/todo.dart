import 'package:flutter/material.dart';

class Todo {
  int id;
  String todo;
  Color color;
  bool done;
  DateTime date;

  Todo(
      {required this.id,
      required this.todo,
      required this.done,
      required this.color,
      required this.date});
}
