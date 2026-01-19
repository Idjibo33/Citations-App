import 'package:citations/citation.dart';
import 'package:citations/service.dart';
import 'package:flutter/material.dart';

class CitationProvider extends ChangeNotifier {
  List<Quotes> citations = [];
  bool citationChargee = false;

  Future<void> getCitations() async {
    final x = await ServiceCitation().getCitations();
    citations = x;
    citationChargee = true;
    notifyListeners();
  }
}
