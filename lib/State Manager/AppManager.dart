import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  var thememode = ThemeMode.system;
  bool isDark = false;

  bool get CurrentTheme => isDark == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    isOn == true ? thememode = ThemeMode.dark : thememode = ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final LightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
  );
  static final DarkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[900],
    colorScheme: ColorScheme.dark(),
  );
}
