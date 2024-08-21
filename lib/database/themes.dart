import 'package:flutter/material.dart';

// final lightMode = ThemeData(
//     brightness: Brightness.light,
//     primaryColor: Colors.purple,
//     listTileTheme: ListTileThemeData(
//
//     ),
//     useMaterial3: true,
//     appBarTheme: const AppBarTheme(
//       centerTitle: true,
//       iconTheme: IconThemeData(
//         color: Colors.white,
//       ),
//       titleTextStyle: TextStyle(
//           color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
//     ),
//     textTheme: const TextTheme(
//       bodyMedium: TextStyle(),
//     ));
//
// final darkMode = ThemeData(
//     brightness: Brightness.dark,
//     primaryColor: Colors.purple,
//     useMaterial3: true,
//     appBarTheme: const AppBarTheme(
//       centerTitle: true,
//       iconTheme: IconThemeData(
//         color: Colors.white,
//       ),
//       titleTextStyle: TextStyle(
//           color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
//     ),
//     textTheme: const TextTheme(
//       bodyMedium: TextStyle(),
//     ));

final darkMode = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.dark,
    background: Colors.grey[900],
    primary: Colors.grey[800],
    secondary: Colors.grey[700],
    inversePrimary: Colors.grey[300],
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      fontSize: 14,
      color: Colors.grey[300],
    ),
  ),
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    color: Colors.grey[800],
    centerTitle: true,
    titleTextStyle: const TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
);

final lightMode = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple,
    brightness: Brightness.light,
    background: Colors.white,
    primary: Colors.purple[200],
    secondary: Colors.grey[100],
    inversePrimary: Colors.purple[800],
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
  ),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    color: Colors.purple,
    centerTitle: true,
    titleTextStyle: TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
);
