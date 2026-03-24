import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Premium Dark Color Palette
  static const Color bgDark = Color(0xFF121212); // Deep Black/Gray
  static const Color surfaceDark = Color(0xFF1E1E1E); // Dark Gray
  static const Color accentRed = Color(0xFF990000); // Dark Red
  static const Color textWhite = Color(0xFFE0E0E0); // Off-White
  static const Color textGrey = Color(0xFF808080); // Dim Gray

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgDark,
      appBar: _buildAppBar(),
      drawer: _buildSideMenu(),
      body: _buildNavigationGrid(context),
    );
  }

  // 1. SLEEK APP BAR UI
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(
        'W O G',
        style: TextStyle(
          color: textWhite,
          fontWeight: FontWeight.w300, // Slim font
          letterSpacing: 6.0, // Sleek spacing
          fontSize: 20,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: bgDark,
      iconTheme: const IconThemeData(color: textWhite),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(color: surfaceDark, height: 1.0), // Thin bottom border
      ),
    );
  }

  // 2. MINIMALIST SIDE MENU (DRAWER) UI
  Widget _buildSideMenu() {
    return Drawer(
      backgroundColor: bgDark,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 80, bottom: 40),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: surfaceDark, width: 1)),
            ),
            child: const Column(
              children: [
                Icon(Icons.language, color: accentRed, size: 40),
                SizedBox(height: 16),
                Text(
                  'WORLD OF GOD',
                  style: TextStyle(
                    color: textWhite,
                    fontSize: 14,
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              children: [
                _menuItem(Icons.login_outlined, 'లాగిన్'),
                _menuItem(Icons.mail_outline, 'కాంటాక్ట్'),
                _menuItem(Icons.library_books_outlined, 'పుస్తకాలు'),
                _menuItem(Icons.help_outline, 'Q & A'),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'v 1.0.0',
              style: TextStyle(color: textGrey, fontSize: 12, letterSpacing: 2.0),
            ),
          )
        ],
      ),
    );
  }

  // Side Menu Item Helper
  Widget _menuItem(IconData icon, String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      leading: Icon(icon, color: textGrey, size: 22),
      title: Text(
        title,
        style: const TextStyle(
          color: textWhite,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.0,
        ),
      ),
      onTap: () {},
    );
  }

  // 3. SLEEK NAVIGATION GRID UI
  Widget _buildNavigationGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.0,
        children: [
          _navCard('బైబిల్', Icons.menu_book_outlined, () {}),
          _navCard('మ్యూజిక్', Icons.music_note_outlined, () {}),
          _navCard('బుక్స్', Icons.book_outlined, () {}),
          _navCard('PROJECT H', Icons.work_outline, () {}),
        ],
      ),
    );
  }

  // Sleek Outlined Card Helper
  Widget _navCard(String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      splashColor: accentRed.withOpacity(0.1),
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.circular(2), // Sharp corners
      child: Container(
        decoration: BoxDecoration(
          color: bgDark,
          border: Border.all(color: surfaceDark, width: 1.5),
          borderRadius: BorderRadius.circular(2), // Sharp minimalist look
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: accentRed), // Dark Red Accent
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: textWhite,
                letterSpacing: 2.0, // Premium spacing
              ),
            ),
          ],
        ),
      ),
    );
  }
}
