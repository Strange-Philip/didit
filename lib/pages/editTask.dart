import 'package:didit/componets/colors.dart';
import 'package:didit/componets/textStyles.dart';
import 'package:didit/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditTaskPage extends StatefulWidget {
  final Todo todo;
  const EditTaskPage({super.key, required this.todo});

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  final TextEditingController _controller = TextEditingController();
  String task = '';
  @override
  void initState() {
    String task = widget.todo.todo!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(widget.todo.color!),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor:Color(widget.todo.color!),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: DiditColors.fullWhite,
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'New task added!',
                        style: DiditTextStyles.bodyStyle
                            .copyWith(color: Colors.black, fontSize: 24),
                      ),
                      Icon(
                        Icons.check_circle,
                        color: DiditColors.accentGreen,
                        size: 35,
                      )
                    ],
                  ),
                ));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                    color: task.isEmpty ?Color(widget.todo.color!): Colors.black,
                    border: Border.all(
                      width: 2,
                      color: task.isEmpty ? Colors.black :Color(widget.todo.color!),
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  'Save',
                  style: DiditTextStyles.bodyStyle.copyWith(
                      color: task.isEmpty ? Colors.black : Color(widget.todo.color!),
                      fontSize: 20),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextFormField(
                  // controller: _controller,
                  autofocus: true,
                  maxLength: 50,
                  initialValue: widget.todo.todo,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    setState(() {
                      task = value;
                    });
                  },
                  maxLines: 10,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter new task ',
                      hintStyle: DiditTextStyles.bodyStyle.copyWith(
                          color: Colors.white.withOpacity(0.5), fontSize: 40)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
