import 'package:flutter/material.dart';

class FeatureToolbar extends StatelessWidget {
  const FeatureToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      {'icon': Icons.audiotrack, 'label': 'Audio'},
      {'icon': Icons.compare_arrows, 'label': 'Compare'},
      {'icon': Icons.font_download, 'label': 'Fonts'},
      {'icon': Icons.highlight, 'label': 'Highlights'},
      {'icon': Icons.bookmark, 'label': 'Bookmarks'},
      {'icon': Icons.note, 'label': 'Notes'},
      {'icon': Icons.calendar_today, 'label': 'Plans'},
      {'icon': Icons.share, 'label': 'Share'},
      {'icon': Icons.image, 'label': 'Verse Image'},
      {'icon': Icons.library_books, 'label': 'Dictionary'},
      {'icon': Icons.translate, 'label': 'Versions'},
      {'icon': Icons.sync, 'label': 'Sync'},
    ];

    return Container(
      height: 85,
      decoration: const BoxDecoration(
        color: Color(0xFF171717),
        border: Border(
          bottom: BorderSide(color: Colors.white12, width: 1),
          top: BorderSide(color: Colors.white12, width: 1),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: features.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF262626),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.3), width: 1),
                  ),
                  child: Icon(
                    features[index]['icon'] as IconData, 
                    color: const Color(0xFFD4AF37), // Premium Gold Color
                    size: 22
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  features[index]['label'] as String,
                  style: const TextStyle(color: Colors.white70, fontSize: 11, letterSpacing: 0.5),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
