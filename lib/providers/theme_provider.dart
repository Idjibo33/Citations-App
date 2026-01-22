import 'package:citations/services/theme_preferences.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isLightMode = true;

  ThemeProvider(this.isLightMode);
  void changeThemeMode() {
    isLightMode = !isLightMode;
    ThemePreferences().enregistrerTheme(isLightMode);
    notifyListeners();
  }

  void lireThemeMode() {
    ThemePreferences().lireTheme(isLightMode);
    notifyListeners();
  }
}
