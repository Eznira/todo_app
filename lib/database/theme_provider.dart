import 'package:flutter/material.dart';

import 'themes.dart';

class ThemeProvider extends ChangeNotifier {
  // Create a field for holding the current theme
  ThemeData _currentTheme = lightMode;

  // Create a getter for getting the current theme
  ThemeData get currentTheme => _currentTheme;

  set currentTheme(ThemeData themeData) {
    _currentTheme = themeData;
    notifyListeners();
  }
  // Create a method for toggling the theme

  void toggleTheme() {
    currentTheme = currentTheme == lightMode ? darkMode : lightMode;
    notifyListeners();
  }
}
