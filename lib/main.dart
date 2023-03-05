import 'package:didit/models/task_data.dart';
import 'package:didit/pages/onboardpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? avatar;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefences = await SharedPreferences.getInstance();
  // ignore: await_only_futures
  avatar = await prefences.getString('avatar');
  await prefences.setString('intScreen', "");
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
          );
        });
  }
}
