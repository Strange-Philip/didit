import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
    @HiveField(0)
  late String id;
  @HiveField(1)
  late String todo;

  @HiveField(2)
  late bool isCompleted;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final String color;

  Todo({required this.todo, this.isCompleted = false, required this.date, required this.color,required this.id});
}
