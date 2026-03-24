class TeluguMapping {
  // పూర్తి 66 పుస్తకాల స్టాటిక్ మ్యాపింగ్
  static const Map<String, String> bibleBooks = {
    // పాత నిబంధన (Old Testament)
    'GEN': 'ఆదికాండము', 'EXO': 'నిర్గమకాండము', 'LEV': 'లేవీయకాండము', 'NUM': 'సంఖ్యాకాండము', 
    'DEU': 'ద్వితీయోపదేశకాండము', 'JOS': 'యెహోషువ', 'JDG': 'న్యాయాధిపతులు', 'RUT': 'రూతు', 
    '1SA': '1 సమూయేలు', '2SA': '2 సమూయేలు', '1KI': '1 రాజులు', '2KI': '2 రాజులు', 
    '1CH': '1 దినవృత్తాంతములు', '2CH': '2 దినవృత్తాంతములు', 'EZR': 'ఎజ్రా', 'NEH': 'నెహెమ్యా', 
    'EST': 'ఎస్తేరు', 'JOB': 'యోబు', 'PSA': 'కీర్తనల గ్రంథము', 'PRO': 'సామెతలు', 
    'ECC': 'ప్రసంగి', 'SNG': 'పరమగీతము', 'ISA': 'యెషయా', 'JER': 'యిర్మీయా', 
    'LAM': 'విలాపవాక్యములు', 'EZK': 'యెహెజ్కేలు', 'DAN': 'దానియేలు', 'HOS': 'హోషేయ', 
    'JOL': 'యోవేలు', 'AMO': 'ఆమోసు', 'OBA': 'ఓబద్యా', 'JON': 'యోనా', 'MIC': 'మీకా', 
    'NAH': 'నహూము', 'HAB': 'హబక్కూకు', 'ZEP': 'జెఫన్యా', 'HAG': 'హగ్గయి', 
    'ZEC': 'జెకర్యా', 'MAL': 'మలాకీ',
    
    // క్రొత్త నిబంధన (New Testament)
    'MAT': 'మత్తయి సువార్త', 'MRK': 'మార్కు సువార్త', 'LUK': 'లూకా సువార్త', 'JHN': 'యోహాను సువార్త', 
    'ACT': 'అపొస్తలుల కార్యములు', 'ROM': 'రోమీయులకు', '1CO': '1 కొరింథీయులకు', '2CO': '2 కొరింథీయులకు', 
    'GAL': 'గలతీయులకు', 'EPH': 'ఎఫెసీయులకు', 'PHP': 'ఫిలిప్పీయులకు', 'COL': 'కొలొస్సయులకు', 
    '1TH': '1 థెస్సలొనీకయులకు', '2TH': '2 థెస్సలొనీకయులకు', '1TI': '1 తిమోతికి', '2TI': '2 తిమోతికి', 
    'TIT': 'తీతుకు', 'PHM': 'ఫిలేమోనుకు', 'HEB': 'హెబ్రీయులకు', 'JAS': 'యాకోబు', 
    '1PE': '1 పేతురు', '2PE': '2 పేతురు', '1JN': '1 యోహాను', '2JN': '2 యోహాను', 
    '3JN': '3 యోహాను', 'JUD': 'యూదా', 'REV': 'ప్రకటన గ్రంథము',
  };

  // UI కోసం లిస్ట్స్
  static const List<String> oldTestamentCodes = [
    'GEN', 'EXO', 'LEV', 'NUM', 'DEU', 'JOS', 'JDG', 'RUT', '1SA', '2SA', '1KI', '2KI', 
    '1CH', '2CH', 'EZR', 'NEH', 'EST', 'JOB', 'PSA', 'PRO', 'ECC', 'SNG', 'ISA', 'JER', 
    'LAM', 'EZK', 'DAN', 'HOS', 'JOL', 'AMO', 'OBA', 'JON', 'MIC', 'NAH', 'HAB', 'ZEP', 
    'HAG', 'ZEC', 'MAL'
  ];

  static const List<String> newTestamentCodes = [
    'MAT', 'MRK', 'LUK', 'JHN', 'ACT', 'ROM', '1CO', '2CO', 'GAL', 'EPH', 'PHP', 'COL', 
    '1TH', '2TH', '1TI', '2TI', 'TIT', 'PHM', 'HEB', 'JAS', '1PE', '2PE', '1JN', '2JN', 
    '3JN', 'JUD', 'REV'
  ];

  static String getTeluguName(String bookCode) {
    return bibleBooks[bookCode] ?? bookCode;
  }
}
