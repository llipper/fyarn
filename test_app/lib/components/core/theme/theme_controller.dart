import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  static final ThemeController _instance = ThemeController._internal();
  static ThemeController get instance => _instance;

  ThemeController._internal();

  String _themeName = 'default';
  Brightness _brightness = Brightness.dark; // Começando com o modo premium dark

  String get themeName => _themeName;
  Brightness get brightness => _brightness;

  void setTheme(String themeName) {
    _themeName = themeName;
    notifyListeners();
  }

  void setBrightness(Brightness brightness) {
    _brightness = brightness;
    notifyListeners();
  }

  void toggleBrightness() {
    _brightness = _brightness == Brightness.dark 
        ? Brightness.light 
        : Brightness.dark;
    notifyListeners();
  }
}
