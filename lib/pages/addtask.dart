import 'package:didit/componets/colors.dart';
import 'package:didit/componets/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _controller = TextEditingController();
  String task = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DiditColors.fullBlack,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: DiditColors.fullBlack,
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
                        style: DiditTextStyles.bodyStyle.copyWith(
                            color: task.isEmpty ? Colors.black : Colors.black,
                            fontSize: 24),
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
                    color: task.isEmpty ? Colors.black : Colors.white,
                    border: Border.all(
                      width: 2,
                      color: task.isEmpty ? Colors.white : Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  'Save',
                  style: DiditTextStyles.bodyStyle.copyWith(
                      color: task.isEmpty ? Colors.white : Colors.black,
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
                child: TextField(
                  controller: _controller,
                  autofocus: true,
                  maxLength: 140,
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
