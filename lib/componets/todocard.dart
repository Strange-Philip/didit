import 'package:didit/componets/textStyles.dart';
import 'package:didit/models/todo.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  Todo todo;
  TodoCard({super.key, required this.todo});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onDoubleTap: () {
          setState(() {
            widget.todo.done = true;
          });
          print('double tapped');
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          decoration: BoxDecoration(
              color: widget.todo.color,
              borderRadius: BorderRadius.circular(35)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.todo.todo,
              maxLines: 2,
              style: DiditTextStyles.bodyStyle.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  decoration: widget.todo.done
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ),
    );
  }
}
