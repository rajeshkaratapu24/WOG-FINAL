import 'package:flutter/material.dart';

class FeatureToolbar extends StatelessWidget {
  const FeatureToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    // 20+ ఫీచర్స్ లిస్ట్
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

    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: features.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(features[index]['icon'] as IconData, color: Colors.blueAccent, size: 24),
                const SizedBox(height: 4),
                Text(
                  features[index]['label'] as String,
                  style: const TextStyle(color: Colors.white70, fontSize: 10),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}