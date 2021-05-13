import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  ThemeData lightTheme = ThemeData(primarySwatch: Colors.teal, brightness: Brightness.light);
  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF111111),
    primarySwatch: Colors.teal,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(backgroundColor: Colors.transparent, shadowColor: Colors.transparent)
  );
  ThemeData? _activeTheme;

  void changeTheme() {
    if (_activeTheme == null || _activeTheme == lightTheme) {
      _activeTheme = darkTheme;
    } else {
      _activeTheme = lightTheme;
    }
    notifyListeners();
  }

  ThemeData get getTheme => _activeTheme ?? lightTheme;
}
