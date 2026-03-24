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
    Future.microtask(() {
      _bibleLogic.loadChapter(widget.bookCode, widget.chapter);
    });
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
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Color(0xFFD4AF37)),
            onPressed: () {
              // ఎర్రర్ వస్తే ఫోర్స్ గా రీలోడ్ చేయడానికి
              _bibleLogic.loadChapter(widget.bookCode, widget.chapter);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const FeatureToolbar(),
          Expanded(
            child: AnimatedBuilder(
              animation: _bibleLogic,
              builder: (context, child) {
                if (_bibleLogic.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: Color(0xFFD4AF37)),
                  );
                }

                if (_bibleLogic.currentVerses.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.warning_amber_rounded, color: Colors.white54, size: 48),
                          const SizedBox(height: 16),
                          Text(
                            'వచనాలు దొరకలేదు.\nబుక్: ${widget.bookCode}, అధ్యాయం: ${widget.chapter}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white54, fontSize: 16),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF262626)),
                            onPressed: () => _bibleLogic.loadChapter(widget.bookCode, widget.chapter),
                            child: const Text('మళ్లీ ప్రయత్నించండి', style: TextStyle(color: Color(0xFFD4AF37))),
                          )
                        ],
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(20.0),
                  physics: const BouncingScrollPhysics(),
                  itemCount: _bibleLogic.currentVerses.length, 
                  itemBuilder: (context, index) {
                    final verseData = _bibleLogic.currentVerses[index];
                    int verseNum = int.tryParse(verseData['vnumber'] ?? '0') ?? index + 1;
                    
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
                              verseData['text'] ?? '', 
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
