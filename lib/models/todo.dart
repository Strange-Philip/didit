import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Todo {
  int id;
  String todo;
  String color;
  bool done;
  DateTime date;

  Todo(
      {required this.id,
      required this.todo,
      required this.done,
      required this.color,
      required this.date});
}


