import 'package:citations/constants.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Styles.couleurePrimaire,
      brightness: Brightness.dark,
    ),
  );
}
