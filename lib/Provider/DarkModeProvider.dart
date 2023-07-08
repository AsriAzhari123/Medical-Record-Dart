import 'package:flutter/material.dart';

class DarkModeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  get getisDarkMode => _isDarkMode;
  set isDarkMode(bool value) => _isDarkMode = value;

  void changeDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
