import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:xml/xml.dart';

class BibleLogic extends ChangeNotifier {
  List<Map<String, String>> currentVerses = [];
  bool isLoading = false;
  
  static XmlDocument? _parsedBible;

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
      if (_parsedBible == null) {
        // 1. XML స్ట్రింగ్ లోడ్ చేయడం
        String xmlString = await rootBundle.loadString('assets/telugu_bible.xml');
        
        // --- AUTO-FIX LOGIC ---
        // ఇన్‌విజిబుల్ క్యారెక్టర్స్ (Non-breaking spaces) తొలగించడం
        xmlString = xmlString.replaceAll('\u00A0', ' ').trim();
        
        // ఒకవేళ XML ఫార్మాట్ తప్పుగా ఉండి <XMLBIBLE> మిస్ అయితే ఫోర్స్ గా యాడ్ చేయడం
        if (!xmlString.contains('<XMLBIBLE>')) {
           int firstBookIndex = xmlString.indexOf('<BIBLEBOOK');
           if (firstBookIndex != -1) {
             xmlString = '<?xml version="1.0"?>\n<XMLBIBLE>\n${xmlString.substring(firstBookIndex)}';
             if (!xmlString.endsWith('</XMLBIBLE>')) {
               xmlString += '\n</XMLBIBLE>';
             }
           }
        }
        // ----------------------

        _parsedBible = XmlDocument.parse(xmlString);
      }

      String actualXmlName = xmlBookNames[bookCode] ?? bookCode;
      final books = _parsedBible!.findAllElements('BIBLEBOOK');
      
      final targetBook = books.firstWhere(
        (b) {
          final xmlBName = (b.getAttribute('bname') ?? '').toLowerCase().trim();
          final targetName = actualXmlName.toLowerCase().trim();
          return xmlBName == targetName || xmlBName.contains(targetName);
        },
        orElse: () => throw Exception('Book "$actualXmlName" not found in XML'),
      );

      final chapters = targetBook.findAllElements('CHAPTER');
      final targetChapter = chapters.firstWhere(
        (c) => c.getAttribute('cnumber')?.trim() == chapterNum.toString(),
        orElse: () => throw Exception('Chapter "$chapterNum" not found'),
      );

      final verses = targetChapter.findAllElements('VERS');
      currentVerses = verses.map((v) {
        return {
          'vnumber': v.getAttribute('vnumber') ?? '',
          'text': v.innerText.trim(),
        };
      }).toList();

    } catch (e) {
      debugPrint('XML Parsing Error: $e');
      currentVerses = [
        {
          'vnumber': '!',
          'text': 'XML ఎర్రర్: $e\n(మీ బ్రౌజర్ పాత ఫైల్ ని సేవ్ చేసుకుంది. దయచేసి బ్రౌజర్ క్యాష్ (Clear Cache) చేసి మళ్లీ ప్రయత్నించండి).'
        }
      ];
    }

    isLoading = false;
    notifyListeners();
  }
}
