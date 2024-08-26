import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/database/task_provider.dart';
import 'package:todo_app/notes_dir/data/notes_provider.dart';
import 'package:todo_app/notes_dir/screens/note_page.dart';
import 'package:todo_app/screens/home_page.dart';

import 'database/theme_provider.dart';

void main() async {
  ///Initialize hive box
  await Hive.initFlutter();

  ///Create local storage for tasklist
  var localStorageTask = await Hive.openBox("taskList");
  var localStorageNotes = await Hive.openBox("noteList");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => NotesProvider()),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      debugShowCheckedModeBanner: false,
      home: const Home(),
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      routes: {
        "/home": (context) => Home(),
        "/note_page": (context) => NotePage(),
      },
    );
  }
}

// todo: solve 1. empty task
