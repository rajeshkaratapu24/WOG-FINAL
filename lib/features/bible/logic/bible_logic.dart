import 'package:flutter/material.dart';

class BibleLogic extends ChangeNotifier {
  String selectedBook = 'GEN';
  int selectedChapter = 1;

  void updateSelection(String book, int chapter) {
    selectedBook = book;
    selectedChapter = chapter;
    notifyListeners();
  }
}
