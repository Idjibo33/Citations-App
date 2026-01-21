import 'package:citations/accueil_ecran.dart';
import 'package:citations/citation_provider.dart';
import 'package:citations/constants.dart';
import 'package:citations/page_view_provider.dart';
import 'package:citations/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CitationProvider()..getCitations(),
        ),
        ChangeNotifierProvider(create: (context) => PageViewProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeProvider().darkMode,
      debugShowCheckedModeBanner: false,
      home: AccueilEcran(),
    );
  }
}
