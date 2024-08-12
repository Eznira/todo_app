import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/screens/Splash_screen.dart';
import 'screens/home_page.dart';

void main() async {

  ///Initialize hive box
  await Hive.initFlutter();

  ///Create local storage for tasklist
  var localStorage = await Hive.openBox("taskList");

  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        primaryColor: Colors.purple,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
        ),
      ),
    );
  }
}

// todo: solve 1. empty task