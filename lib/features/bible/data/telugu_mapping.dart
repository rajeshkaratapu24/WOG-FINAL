class TeluguMapping {
  // స్టాటిక్ వేరియబుల్ మ్యాపింగ్ (మీ రూల్ ప్రకారం)
  static const Map<String, String> bibleBooks = {
    'GEN': 'ఆదికాండము',
    'EXO': 'నిర్గమకాండము',
    'LEV': 'లేవీయకాండము',
    'MAT': 'మత్తయి సువార్త',
    'MRK': 'మార్కు సువార్త',
    'LUK': 'లూకా సువార్త',
    'JHN': 'యోహాను సువార్త',
    'REV': 'ప్రకటన గ్రంథము',
    // మిగతా పుస్తకాలు ఇక్కడ యాడ్ చేస్తాం
  };

  static String getTeluguName(String bookCode) {
    return bibleBooks[bookCode] ?? bookCode;
  }
}