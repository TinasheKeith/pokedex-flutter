import 'package:flutter/foundation.dart';

class AppThemeMode with ChangeNotifier {
  bool isDarkMode = false;

  void toggleIsDarkMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}