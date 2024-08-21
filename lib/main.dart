import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/database/database.dart';
import 'package:todo_app/database/theme_provider.dart';
import 'package:todo_app/screens/Splash_screen.dart';

void main() async {
  ///Initialize hive box
  await Hive.initFlutter();

  ///Create local storage for tasklist
  var localStorage = await Hive.openBox("taskList");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataBase()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
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
      home: SplashScreen(),
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}

// todo: solve 1. empty task
