import 'package:flutter/material.dart';

final lightMode = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple,
    brightness: Brightness.light,
    background: Colors.white,
    primary: Colors.purple,
    secondary: Colors.purple[200],
    tertiary: Colors.purple[100],
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

final darkMode = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple,
    brightness: Brightness.dark,
    background: Colors.grey[900],
    primary: Colors.grey[700],
    secondary: Colors.grey[700],
    tertiary: Colors.grey[600],
    inversePrimary: Colors.grey[200],
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
    iconTheme: IconThemeData(
      color: Colors.grey[200],
    ),
  ),
);
