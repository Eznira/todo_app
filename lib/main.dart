import 'package:flutter/material.dart';
import 'package:todo_app/util/task_tile.dart';
import 'add_task_dialog.dart';
import 'home_page.dart';

void main() => runApp(const App());

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
      home: Home(),
      theme: ThemeData(
        primaryColor: Colors.purple,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// todo: solve 1. empty task