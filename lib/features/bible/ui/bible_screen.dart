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
                    _buildBooksGrid(['GEN', 'EXO', 'LEV']),
                    const SizedBox(height: 32),
                    _buildSectionHeader('NEW TESTAMENT', 'క్రొత్త నిబంధన'),
                    const SizedBox(height: 16),
                    _buildBooksGrid(['MAT', 'MRK', 'LUK', 'JHN', 'REV']),
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
          color: Color(0xFFD4AF37), // Gold Title
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

  Widget _buildBooksGrid(List<String> bookCodes) {
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
          onTap: () {},
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
}
