import 'package:flutter/material.dart';
import '../data/telugu_mapping.dart';
import 'widgets/feature_toolbar.dart';

class BibleScreen extends StatelessWidget {
  const BibleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: _buildBibleAppBar(context),
      body: Column(
        children: [
          const FeatureToolbar(), // సపరేట్ చేసిన విడ్జెట్ ని ఇక్కడ కాల్ చేశాం
          const Divider(color: Colors.white12, height: 1),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader('Old Testament (పాత నిబంధన)'),
                    _buildBooksGrid(['GEN', 'EXO', 'LEV']),
                    const SizedBox(height: 24),
                    _buildSectionHeader('New Testament (క్రొత్త నిబంధన)'),
                    _buildBooksGrid(['MAT', 'MRK', 'LUK', 'JHN', 'REV']),
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
      backgroundColor: const Color(0xFF1E1E1E),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        'BIBLE',
        style: TextStyle(color: Colors.white, fontFamily: 'serif', letterSpacing: 2.0),
      ),
      centerTitle: true,
      actions: [
        IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {}),
        IconButton(icon: const Icon(Icons.history, color: Colors.white), onPressed: () {}),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'serif',
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildBooksGrid(List<String> bookCodes) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2.5,
      ),
      itemCount: bookCodes.length,
      itemBuilder: (context, index) {
        String code = bookCodes[index];
        String teluguName = TeluguMapping.getTeluguName(code);
        
        return InkWell(
          onTap: () {
            // భవిష్యత్తులో Chapter selection కి నావిగేట్ అవుతుంది
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF262626),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white12),
            ),
            alignment: Alignment.center,
            child: Text(
              teluguName,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
        );
      },
    );
  }
}