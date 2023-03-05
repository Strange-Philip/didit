import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
// class Note {
//   int? _id;
//   String? _title;
//   String? _imagePath;
//   String? _color;
//   int? _isAchived;

//   Note(this._id, this._title,  this._imagePath, this._color,
//       this._isAchived);

//   int? get id => _id;
//   String? get title => _title;
//   String? get imagePath => _imagePath;
//   String? get color => _color;
//   int? get isAchived => _isAchived;

//   String get date {
//     final date = DateTime.fromMicrosecondsSinceEpoch(id!);
//     return DateFormat('EEE h:mm a, dd/MM/yyy').format(date);
//   }
// }
