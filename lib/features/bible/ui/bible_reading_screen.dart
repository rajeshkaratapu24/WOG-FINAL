import 'package:flutter/material.dart';
import '../logic/bible_logic.dart';
import 'widgets/feature_toolbar.dart';

class BibleReadingScreen extends StatefulWidget {
  final String bookCode;
  final String bookName;
  final int chapter;
  final int initialVerse;

  const BibleReadingScreen({
    super.key,
    required this.bookCode,
    required this.bookName,
    required this.chapter,
    required this.initialVerse,
  });

  @override
  State<BibleReadingScreen> createState() => _BibleReadingScreenState();
}

class _BibleReadingScreenState extends State<BibleReadingScreen> {
  final BibleLogic _bibleLogic = BibleLogic();

  @override
  void initState() {
    super.initState();
    // స్క్రీన్ ఓపెన్ అవ్వగానే XML డేటా లాగడం స్టార్ట్ అవుతుంది
    _bibleLogic.loadChapter(widget.bookCode, widget.chapter);
  }

  @override
  void dispose() {
    _bibleLogic.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '${widget.bookName} ${widget.chapter}',
          style: const TextStyle(color: Color(0xFFD4AF37), fontFamily: 'serif', fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const FeatureToolbar(), // 20+ ఫీచర్స్ గోల్డ్ టూల్ బార్
          Expanded(
            // AnimatedBuilder: Web/WASM లో async డేటా రాగానే కచ్చితంగా UI ని అప్‌డేట్ చేస్తుంది
            child: AnimatedBuilder(
              animation: _bibleLogic,
              builder: (context, child) {
                // 1. లోడింగ్ అవుతుంటే లోడర్ చూపిస్తుంది
                if (_bibleLogic.isLoading) {
                  return const Center(child: CircularProgressIndicator(color: Color(0xFFD4AF37)));
                }

                // 2. ఒకవేళ డేటా రాకపోతే ఎంప్టీ మెసేజ్
                if (_bibleLogic.currentVerses.isEmpty) {
                  return const Center(
                    child: Text(
                      'వచనాలు దొరకలేదు. XML డేటా లేదా మ్యాపింగ్ చెక్ చేయండి.',
                      style: TextStyle(color: Colors.white54, fontSize: 16),
                    ),
                  );
                }

                // 3. డేటా సక్సెస్ ఫుల్ గా వస్తే లిస్ట్ చూపిస్తుంది
                return ListView.builder(
                  padding: const EdgeInsets.all(20.0),
                  physics: const BouncingScrollPhysics(),
                  itemCount: _bibleLogic.currentVerses.length, 
                  itemBuilder: (context, index) {
                    final verseData = _bibleLogic.currentVerses[index];
                    int verseNum = int.tryParse(verseData['vnumber'] ?? '0') ?? index + 1;
                    
                    // మీరు సెలెక్ట్ చేసిన వచనం గోల్డ్ కలర్ లో హైలైట్ అవుతుంది
                    bool isHighlighted = verseNum == widget.initialVerse;

                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                      margin: const EdgeInsets.only(bottom: 8.0),
                      decoration: BoxDecoration(
                        color: isHighlighted ? const Color(0xFFD4AF37).withOpacity(0.15) : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$verseNum.',
                            style: TextStyle(
                              color: isHighlighted ? const Color(0xFFD4AF37) : Colors.white54, 
                              fontWeight: FontWeight.bold, 
                              fontSize: 16
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              verseData['text'] ?? '', // అసలైన XML వచనం
                              style: const TextStyle(
                                color: Colors.white, 
                                fontSize: 18, 
                                height: 1.6, 
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
