import 'package:didit/componets/colors.dart';
import 'package:didit/componets/textStyles.dart';
import 'package:didit/componets/todocard.dart';
import 'package:didit/pages/addtask.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';

import '../models/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DateTime> dates = [
    DateTime.now().subtract(const Duration(days: 2)),
    DateTime.now().subtract(const Duration(days: 1)),
    DateTime.now(),
    DateTime.now().add(const Duration(days: 1))
  ];
  List<String> months = [
    'Jan',
    'Feb',
    'March',
    'Apr',
    'May',
    'June',
    'July',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  PageController? _pageController;
  int currentIndex = 2;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 2);
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DiditColors.fullBlack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
            child: GestureDetector(
              onTap: () {
                showBtnSheet(context);
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: DiditColors.fullWhite.withOpacity(0.9),
                child: SvgPicture.asset(
                  "images/avatar0.svg",
                  height: 40,
                  width: 40,
                  color: DiditColors.fullBlack,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 60,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: ListView.builder(
                      itemCount: dates.length,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            skipFunction(index);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: index == currentIndex ? 25 : 10),
                            decoration: index == currentIndex
                                ? BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25))
                                : const BoxDecoration(),
                            child: Text(
                              dates[index].day == DateTime.now().day
                                  ? "today"
                                  : dates[index].day ==
                                          DateTime.now()
                                              .subtract(const Duration(days: 1))
                                              .day
                                      ? "yesterday"
                                      : dates[index].day ==
                                              DateTime.now()
                                                  .add(const Duration(days: 1))
                                                  .day
                                          ? "tomorrow"
                                          : "${months[dates[index].month - 1].toString()} ${dates[index].day.toString()}  ",
                              style: DiditTextStyles.bodyStyle.copyWith(
                                fontSize: 22,
                                color: index == currentIndex
                                    ? Colors.black
                                    : Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: PageView(
                controller: _pageController,
                onPageChanged: onChangedFunction,
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "images/done.svg",
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.height * 0.3,
                          color: Colors.white,
                        ),
                        Text(
                          "You’ve Completed\nall tasks today ",
                          maxLines: 2,
                          style: DiditTextStyles.bodyStyle.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "images/empty.svg",
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: MediaQuery.of(context).size.height * 0.35,
                          color: Colors.white,
                        ),
                        Text(
                          "No tasks \nadded today",
                          maxLines: 2,
                          style: DiditTextStyles.bodyStyle.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      TodoCard(
                          todo: Todo(
                              id: 23432,
                              todo: "build program",
                              date: DateTime.now(),
                              done: false,
                              color: DiditColors.accentBlue)),
                      TodoCard(
                          todo: Todo(
                              id: 4535,
                              todo: "run",
                              date: DateTime.now(),
                              done: true,
                              color: DiditColors.accentGreen)),
                      TodoCard(
                          todo: Todo(
                              id: 4535,
                              todo: "run",
                              date: DateTime.now(),
                              done: true,
                              color: DiditColors.accentRed)),
                      TodoCard(
                          todo: Todo(
                              id: 4535,
                              todo: "dance",
                              date: DateTime.now(),
                              done: true,
                              color: DiditColors.accentOrange)),
                      TodoCard(
                          todo: Todo(
                              id: 4535,
                              todo: "run",
                              date: DateTime.now(),
                              done: false,
                              color: DiditColors.accentYellow)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const AddTaskPage())));
                          },
                          child: Container(
                            height: 70,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 35),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(35)),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Add New Task",
                                    maxLines: 2,
                                    style: DiditTextStyles.bodyStyle.copyWith(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                    textAlign: TextAlign.start,
                                  ),
                                  const Icon(
                                    LineIcons.plus,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "images/future.svg",
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: MediaQuery.of(context).size.height * 0.35,
                          color: Colors.white,
                        ),
                        Text(
                          "Add task\nfor the future",
                          maxLines: 2,
                          style: DiditTextStyles.bodyStyle.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: currentIndex == 2
          ? Container(
              height: 160,
              padding: const EdgeInsets.only(left: 20, right: 10, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Completed",
                      maxLines: 2,
                      style: DiditTextStyles.bodyStyle.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Completed tasks",
                            maxLines: 2,
                            style: DiditTextStyles.bodyStyle.copyWith(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.lineThrough),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "23",
                            maxLines: 2,
                            style: DiditTextStyles.bodyStyle.copyWith(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const AddTaskPage())));
                },
                child: Container(
                  height: 70,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(35)),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add New Task",
                          maxLines: 2,
                          style: DiditTextStyles.bodyStyle.copyWith(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                          textAlign: TextAlign.start,
                        ),
                        const Icon(
                          LineIcons.plus,
                          color: Colors.white,
                          size: 35,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  void showBtnSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setBtnState) {
            return Container(
                color: Colors.transparent,
                child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height -
                          MediaQuery.of(context).size.height * 0.6,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 40,
                                  )),
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            "images/avatar0.svg",
                            height: 100,
                            width: 100,
                            color: Colors.white,
                          ),
                          Text(
                            "Kwesi Parker",
                            maxLines: 2,
                            style: DiditTextStyles.bodyStyle.copyWith(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "kwesiparker05@gmail.com",
                            maxLines: 2,
                            style: DiditTextStyles.bodyStyle.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                            textAlign: TextAlign.start,
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 70,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 35),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(
                                        width: 2, color: Colors.white),
                                    borderRadius: BorderRadius.circular(35)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Sign out",
                                    maxLines: 2,
                                    style: DiditTextStyles.bodyStyle.copyWith(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )));
          });
        });
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  skipFunction(int index) {
    _pageController!.jumpToPage(index);
  }
}
