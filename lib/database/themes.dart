import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightMode = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple,
    brightness: Brightness.light,
    background: Colors.white,
    primary: Colors.purple,
    secondary: Colors.purple[200],
    tertiary: Colors.purple[100],
    inversePrimary: Colors.black,
  ),
  textTheme: TextTheme(
    bodyMedium: const TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.sofiaSans(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  // useMaterial3: true,
  appBarTheme: const AppBarTheme(
    color: Colors.purple,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 32,
    ),
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
    inversePrimary: Colors.white,
  ),
  textTheme: TextTheme(
    headlineMedium: GoogleFonts.sofiaSans(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    bodyMedium: const TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
  ),
  // useMaterial3: true,
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
