import 'package:flutter/material.dart';
import '../data/telugu_mapping.dart';
import 'widgets/feature_toolbar.dart';

class BibleScreen extends StatelessWidget {
  const BibleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Premium Deep Dark
      appBar: _buildBibleAppBar(context),
      body: Column(
        children: [
          const FeatureToolbar(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader('OLD TESTAMENT', 'పాత నిబంధన'),
                    const SizedBox(height: 16),
                    _buildBooksGrid(context, TeluguMapping.oldTestamentCodes), // ఫుల్ OT లిస్ట్
                    const SizedBox(height: 32),
                    _buildSectionHeader('NEW TESTAMENT', 'క్రొత్త నిబంధన'),
                    const SizedBox(height: 16),
                    _buildBooksGrid(context, TeluguMapping.newTestamentCodes), // ఫుల్ NT లిస్ట్
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildBibleAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF121212),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        'HOLY BIBLE',
        style: TextStyle(
          color: Color(0xFFD4AF37),
          fontFamily: 'serif', 
          letterSpacing: 2.5, 
          fontWeight: FontWeight.bold, 
          fontSize: 22
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(icon: const Icon(Icons.search, color: Colors.white70), onPressed: () {}),
        IconButton(icon: const Icon(Icons.history, color: Colors.white70), onPressed: () {}),
      ],
    );
  }

  Widget _buildSectionHeader(String engTitle, String teluguTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(engTitle, style: const TextStyle(color: Colors.white54, fontSize: 12, letterSpacing: 2.0, fontWeight: FontWeight.w600)),
        const SizedBox(height: 4),
        Text(teluguTitle, style: const TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'serif', fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildBooksGrid(BuildContext context, List<String> bookCodes) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2.2,
      ),
      itemCount: bookCodes.length,
      itemBuilder: (context, index) {
        String code = bookCodes[index];
        String teluguName = TeluguMapping.getTeluguName(code);
        
        return InkWell(
          onTap: () {
            // బుక్ క్లిక్ చేయగానే చాప్టర్ & వర్స్ సెలెక్షన్ మోడల్ ఓపెన్ అవుతుంది
            _showChapterVerseSelector(context, code, teluguName);
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2A2A2A), Color(0xFF1E1E1E)], 
                begin: Alignment.topLeft, 
                end: Alignment.bottomRight
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(0.05)),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              teluguName, 
              textAlign: TextAlign.center, 
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.5)
            ),
          ),
        );
      },
    );
  }

  // --- NEW FEATURE: Side-by-Side Chapter & Verse Selector ---
  void _showChapterVerseSelector(BuildContext context, String bookCode, String bookName) {
    int selectedChapter = 1; // డీఫాల్ట్ చాప్టర్

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.65, // 65% height
              decoration: const BoxDecoration(
                color: Color(0xFF1A1A1A), // Dark premium background
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                border: Border(top: BorderSide(color: Color(0xFFD4AF37), width: 2)), // Gold top border
              ),
              child: Column(
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      bookName,
                      style: const TextStyle(color: Color(0xFFD4AF37), fontSize: 24, fontFamily: 'serif', fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(color: Colors.white12, height: 1),
                  
                  // Side-by-Side Selection (Row)
                  Expanded(
                    child: Row(
                      children: [
                        // Left Side: Chapters
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                child: Text('అధ్యాయం (Ch)', style: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold)),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: 50, // డమ్మీ చాప్టర్స్ కౌంట్ (తర్వాత లాజిక్ తో అప్‌డేట్ చేద్దాం)
                                  itemBuilder: (context, index) {
                                    int chapterNum = index + 1;
                                    bool isSelected = selectedChapter == chapterNum;
                                    
                                    return InkWell(
                                      onTap: () => setState(() => selectedChapter = chapterNum),
                                      child: Container(
                                        color: isSelected ? const Color(0xFFD4AF37).withOpacity(0.15) : Colors.transparent,
                                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                                        child: Center(
                                          child: Text(
                                            '$chapterNum',
                                            style: TextStyle(
                                              color: isSelected ? const Color(0xFFD4AF37) : Colors.white,
                                              fontSize: isSelected ? 22 : 18,
                                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        const VerticalDivider(color: Colors.white12, width: 1),
                        
                        // Right Side: Verses
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                child: Text('వచనం (Vs)', style: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold)),
                              ),
                              Expanded(
                                child: GridView.builder(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  physics: const BouncingScrollPhysics(),
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemCount: 30, // డమ్మీ వచనాల కౌంట్
                                  itemBuilder: (context, index) {
                                    int verseNum = index + 1;
                                    return InkWell(
                                      onTap: () {
                                        // TODO: చాప్టర్, వచనం సెలెక్ట్ అయ్యాక యాక్చువల్ రీడింగ్ పేజీకి వెళ్ళాలి
                                        Navigator.pop(context);
                                        print('Selected: $bookCode Chapter $selectedChapter, Verse $verseNum');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF262626),
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: Colors.white12),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '$verseNum',
                                            style: const TextStyle(color: Colors.white, fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        );
      },
    );
  }
}
