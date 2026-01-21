import 'package:flutter/material.dart';

class PageViewProvider extends ChangeNotifier {
  int pageViewIndex = 0;
  PageController controlleurPageView = PageController(initialPage: 0);

  //Naviger à la page suivante
  void naviguerPageSuivante() {
    controlleurPageView.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  //Naviger à la page precedente
  void naviguerPagePrecedente() {
    controlleurPageView.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  //Obtenir pageview Index
  void obtenirPageViewIndex(int value) {
    pageViewIndex = value;
    notifyListeners();
  }
}
