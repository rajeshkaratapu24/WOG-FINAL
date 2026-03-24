import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:xml/xml.dart';

class BibleLogic extends ChangeNotifier {
  List<Map<String, String>> currentVerses = [];
  bool isLoading = false;

  // XML లో ఉన్న ఇంగ్లీష్ పేర్లకి మన బుక్ కోడ్స్ కి మ్యాపింగ్ (Static variables rule)
  static const Map<String, String> xmlBookNames = {
    'GEN': 'Genesis', 'EXO': 'Exodus', 'LEV': 'Leviticus', 'NUM': 'Numbers',
    'DEU': 'Deuteronomy', 'JOS': 'Joshua', 'JDG': 'Judges', 'RUT': 'Ruth',
    '1SA': '1 Samuel', '2SA': '2 Samuel', '1KI': '1 Kings', '2KI': '2 Kings',
    '1CH': '1 Chronicles', '2CH': '2 Chronicles', 'EZR': 'Ezra', 'NEH': 'Nehemiah',
    'EST': 'Esther', 'JOB': 'Job', 'PSA': 'Psalms', 'PRO': 'Proverbs',
    'ECC': 'Ecclesiastes', 'SNG': 'Song of Solomon', 'ISA': 'Isaiah', 'JER': 'Jeremiah',
    'LAM': 'Lamentations', 'EZK': 'Ezekiel', 'DAN': 'Daniel', 'HOS': 'Hosea',
    'JOL': 'Joel', 'AMO': 'Amos', 'OBA': 'Obadiah', 'JON': 'Jonah', 'MIC': 'Micah',
    'NAH': 'Nahum', 'HAB': 'Habakkuk', 'ZEP': 'Zephaniah', 'HAG': 'Haggai',
    'ZEC': 'Zechariah', 'MAL': 'Malachi',
    'MAT': 'Matthew', 'MRK': 'Mark', 'LUK': 'Luke', 'JHN': 'John',
    'ACT': 'Acts', 'ROM': 'Romans', '1CO': '1 Corinthians', '2CO': '2 Corinthians',
    'GAL': 'Galatians', 'EPH': 'Ephesians', 'PHP': 'Philippians', 'COL': 'Colossians',
    '1TH': '1 Thessalonians', '2TH': '2 Thessalonians', '1TI': '1 Timothy', '2TI': '2 Timothy',
    'TIT': 'Titus', 'PHM': 'Philemon', 'HEB': 'Hebrews', 'JAS': 'James',
    '1PE': '1 Peter', '2PE': '2 Peter', '1JN': '1 John', '2JN': '2 John',
    '3JN': '3 John', 'JUD': 'Jude', 'REV': 'Revelation'
  };

  Future<void> loadChapter(String bookCode, int chapterNum) async {
    isLoading = true;
    notifyListeners();

    try {
      // 1. XML ఫైల్ లోడ్
      final xmlString = await rootBundle.loadString('assets/telugu_bible.xml');
      final document = XmlDocument.parse(xmlString);

      // 2. మ్యాపింగ్ నుండి XML లో ఉన్న అసలు పేరు లాగడం
      String actualXmlName = xmlBookNames[bookCode] ?? bookCode;

      // 3. బుక్ మరియు చాప్టర్ ని వెతకడం
      final books = document.findAllElements('BIBLEBOOK');
      final targetBook = books.firstWhere(
        (b) => b.getAttribute('bname')?.toLowerCase() == actualXmlName.toLowerCase(),
        orElse: () => throw Exception('Book not found in XML: $actualXmlName'),
      );

      final chapters = targetBook.findAllElements('CHAPTER');
      final targetChapter = chapters.firstWhere(
        (c) => c.getAttribute('cnumber') == chapterNum.toString(),
        orElse: () => throw Exception('Chapter not found'),
      );

      // 4. వర్సెస్ లిస్ట్ అప్‌డేట్
      final verses = targetChapter.findAllElements('VERS');
      currentVerses = verses.map((v) {
        return {
          'vnumber': v.getAttribute('vnumber') ?? '',
          'text': v.innerText.trim(),
        };
      }).toList();

    } catch (e) {
      debugPrint('XML Parsing Error: $e');
      currentVerses = []; // ఎర్రర్ వస్తే లిస్ట్ ఖాళీ అవుతుంది
    }

    isLoading = false;
    notifyListeners();
  }
}
