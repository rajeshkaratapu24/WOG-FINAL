import 'package:flutter/material.dart';

// భవిష్యత్తులో Chapter selection, Highlights, Notes లాజిక్ అంతా ఇక్కడే రాస్తాం
class BibleLogic extends ChangeNotifier {
  String selectedBook = 'GEN';
  int selectedChapter = 1;

  void updateSelection(String book, int chapter) {
    selectedBook = book;
    selectedChapter = chapter;
    notifyListeners();
  }
  
  // పాత ఫీచర్లు (Search, Share, Audio playback) లాజిక్ ఫంక్షన్స్ ఇక్కడ వస్తాయి
}