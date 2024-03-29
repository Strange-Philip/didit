import 'package:didit/models/task_data.dart';
import 'package:didit/pages/addtask.dart';
import 'package:didit/pages/homepage.dart';
import 'package:didit/pages/onboardpage.dart';
import 'package:didit/pages/selectavatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? avatar;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefences = await SharedPreferences.getInstance();
  avatar = await prefences.getString('avatar');
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Hive.initFlutter();
  await Hive.openBox('todos'); // Open the Hive box for todos
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TaskData(),
        builder: (context, child) {
          return MaterialApp(
            title: 'Didit',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const OnboardPage(),
            // initialRoute: avatar == "" || avatar == null ? 'onBoard' : 'homepage',
            initialRoute: 'onBoard',
            routes: {
              'selectAvatar': (context) => SelectAvatar(),
              'onBoard': (context) => OnboardPage(),
              'homepage': (context) => HomePage(),
              'taskAdd': (context) => AddTaskPage(),
            },
          );
        });
  }
}
