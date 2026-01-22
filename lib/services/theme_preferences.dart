import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const String key = "theme";

  Future enregistrerTheme(bool themeMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, themeMode);
  }

  Future lireTheme(bool themeMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final themeMode = prefs.getBool(key);
  }
}
