class TeluguMapping {
  // Static variable mapping for Bible books (As per your rule)
  static const Map<String, String> bibleBooks = {
    'GEN': 'ఆదికాండము',
    'EXO': 'నిర్గమకాండము',
    'MAT': 'మత్తయి సువార్త',
    'REV': 'ప్రకటన గ్రంథము',
    // భవిష్యత్తులో మిగతావి ఇక్కడ యాడ్ చేస్తాం
  };

  static String getTeluguName(String bookCode) {
    return bibleBooks[bookCode] ?? bookCode;
  }
}