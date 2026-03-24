import 'package:flutter/material.dart';
import 'widgets/feature_toolbar.dart'; // పాత టూల్ బార్ ఇక్కడ కూడా వాడుకోవచ్చు

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
  // XML లాజిక్ రెడీ అయ్యాక ఇక్కడ డేటా అప్‌డేట్ అవుతుంది. ప్రస్తుతానికి డమ్మీ టెక్స్ట్.
  final List<String> dummyVerses = [
    "ఆదియందు దేవుడు భూమ్యాకాశములను సృజించెను.",
    "భూమి నిరాకారముగాను శూన్యముగాను ఉండెను; చీకటి అగాధ జలముపైన కమ్మియుండెను; దేవుని ఆత్మ జలములపైన అల్లాడుచుండెను.",
    "దేవుడు వెలుగు కమ్మని పలుకగా వెలుగు కలిగెను.",
    "వెలుగు మంచిదైనట్టు దేవుడు చూచెను; దేవుడు వెలుగును చీకటిని వేరుపరచెను.",
    "దేవుడు వెలుగునకు పగలనియు, చీకటికి రాత్రి అనియు పేరు పెట్టెను. అస్తమయమును ఉదయమును కలుగగా ఒక దినమాయెను."
  ];

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
          const FeatureToolbar(), // టాప్ లో ఫీచర్స్
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20.0),
              physics: const BouncingScrollPhysics(),
              itemCount: dummyVerses.length, // Logic కనెక్ట్ చేశాక BibleLogic.currentVerses.length వాడాలి
              itemBuilder: (context, index) {
                int verseNum = index + 1;
                bool isHighlighted = verseNum == widget.initialVerse;

                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
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
                          dummyVerses[index],
                          style: const TextStyle(
                            color: Colors.white, 
                            fontSize: 18, 
                            height: 1.6, // మంచి రీడింగ్ స్పేస్
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
