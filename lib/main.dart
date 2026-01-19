import 'package:citations/accueil_ecran.dart';
import 'package:citations/citation_provider.dart';
import 'package:citations/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CitationProvider()..getCitations(),
        ),
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Styles.couleurePrimaire),
      ),
      debugShowCheckedModeBanner: false,
      home: AccueilEcran(),
    );
  }
}
