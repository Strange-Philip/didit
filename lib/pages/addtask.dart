import 'dart:math';
import 'package:didit/componets/colors.dart';
import 'package:didit/componets/textStyles.dart';
import 'package:didit/models/task_data.dart';
import 'package:didit/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import '../data/constants.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _controller = TextEditingController();
  String task = '';
  bool firstTime = true;
  Todo? selectedNote;
  Color _color = Colors.black;
  var id;
  final todoBox = Hive.box('todos');
  var colorlist = [
    '0xffEEF511',
    '0xff22CD6E',
    '0xffFF8336',
    '0xff7187FF',
    '0xffFA6159',
    '0xffFF97CA',
    '0xff9CCEFF'
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (firstTime) {
      id = ModalRoute.of(this.context)!.settings.arguments;
      if (id != null) {
        selectedNote = Provider.of<TaskData>(this.context, listen: false).getNote(id);

        _controller.text = selectedNote!.todo;
        _color = id != null ? hexToColor(selectedNote!.color) : Colors.black;
      }
    }
    firstTime = false;
  }

  @override
  Widget build(BuildContext context) {
    String color = (colorlist.toList()..shuffle()).first;

    return Scaffold(
      backgroundColor: _color,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: DiditColors.fullBlack,
        actions: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: GestureDetector(
              onTap: () {
                saveNote(id);
              },
              child: id != null
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                          color: task.isEmpty ? _color : Colors.black,
                          border: Border.all(
                            width: 2,
                            color: task.isEmpty ? Colors.black : _color,
                          ),
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(
                        'Save',
                        style: DiditTextStyles.bodyStyle
                            .copyWith(color: task.isEmpty ? Colors.black : _color, fontSize: 20),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        todoBox.add(Todo(todo: task, date: DateTime.now(), color: color,id: ''));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                            color: task.isEmpty ? Colors.black : Colors.white,
                            border: Border.all(
                              width: 2,
                              color: task.isEmpty ? Colors.white : Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          'Save',
                          style: DiditTextStyles.bodyStyle.copyWith(
                              color: task.isEmpty ? Colors.white : Colors.black, fontSize: 20),
                        ),
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
                child: TextField(
                  controller: _controller,
                  autofocus: true,
                  maxLength: 50,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
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
                      hintStyle: DiditTextStyles.bodyStyle
                          .copyWith(color: Colors.white.withOpacity(0.5), fontSize: 40)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveNote(id) {
    print('done');
    String todo = _controller.text.trim();
    DateTime dateTime;
    bool done = false;
    final _random = new Random();
    List<Color> colorList = [
      DiditColors.accentBlue,
      DiditColors.accentGreen,
      DiditColors.accentLightBlue,
      DiditColors.accentOrange,
      DiditColors.accentPink,
      DiditColors.accentRed,
      DiditColors.accentYellow
    ];
    var element = colorList[_random.nextInt(colorList.length)];
    Color color = element;

    print('done');
    print(todo);
    print("checking : ${color.value.toRadixString(16)}");
    if (id != null) {
      // Provider.of<TaskData>(this.context, listen: false).addOrUpdateNote(
      //     id,
      //     todo,
      //     DateTime.now(),
      //     color.value.toRadixString(16),
      //     done,
      //     EditMode.UPDATE);
      Navigator.pop(this.context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: DiditColors.fullWhite,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Task edited!',
              style: DiditTextStyles.bodyStyle.copyWith(color: Colors.black, fontSize: 24),
            ),
            Icon(
              Icons.check_circle,
              color: DiditColors.accentGreen,
              size: 35,
            )
          ],
        ),
      ));
    } else {
      int id = DateTime.now().microsecondsSinceEpoch;
      print('done');
      // Provider.of<TaskData>(this.context, listen: false).addOrUpdateNote(
      //     id,
      //     todo,
      //     DateTime.now(),
      //     color.value.toRadixString(16),
      //     done,
      //     EditMode.ADD);
      print('doneNow');
      Navigator.of(this.context).pushReplacementNamed('homepage', arguments: id);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: DiditColors.fullWhite,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'New task added!',
              style: DiditTextStyles.bodyStyle.copyWith(color: Colors.black, fontSize: 24),
            ),
            Icon(
              Icons.check_circle,
              color: DiditColors.accentGreen,
              size: 35,
            )
          ],
        ),
      ));
      print("Complete");
    }
  }
}
