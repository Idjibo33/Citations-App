import 'package:citations/constants.dart';
import 'package:citations/ecrans/accueil_ecran.dart';
import 'package:citations/providers/citation_provider.dart';
import 'package:citations/providers/page_view_provider.dart';
import 'package:citations/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final monTheme = prefs.getBool("theme");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CitationProvider()..getCitations(),
        ),
        ChangeNotifierProvider(create: (context) => PageViewProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider(monTheme!)),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isLightMode = context.watch<ThemeProvider>().isLightMode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Styles.couleurePrimaire,
          brightness: isLightMode ? Brightness.light : Brightness.dark,
        ),
      ),
      home: AccueilEcran(),
    );
  }
}
