import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/database/task_provider.dart';
import 'package:todo_app/notes_dir/data/notes_provider.dart';
import 'package:todo_app/notes_dir/screens/note_page.dart';
import 'package:todo_app/screens/home_page.dart';

import 'database/theme_provider.dart';
import 'notes_dir/data/note_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Initialize hive box
  await Hive.initFlutter();

  ///Create local storage for tasklist
  await Hive.openBox("taskList");
  // Generate adapter for noteList
  // and create noteList box
  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox('notes');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => NotesProvider()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      debugShowCheckedModeBanner: false,
      home: const Home(),
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      routes: {
        "/home": (context) => const Home(),
        "/note_page": (context) => const NotePage(),
      },
    );
  }
}
