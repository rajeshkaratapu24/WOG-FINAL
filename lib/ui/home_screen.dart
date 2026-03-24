import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildSideMenu(),
      body: _buildNavigationGrid(context),
      backgroundColor: Colors.grey[100], // యాప్ బ్యాక్‌గ్రౌండ్ కలర్
    );
  }

  // 1. APP BAR UI
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(
        'WORLD OF GOD',
        style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
    );
  }

  // 2. SIDE MENU (DRAWER) UI
  Widget _buildSideMenu() {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Text(
                'WOG Menu',
                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _menuItem(Icons.login, 'లాగిన్ (Login)'),
                _menuItem(Icons.contact_mail, 'కాంటాక్ట్ (Contact)'),
                _menuItem(Icons.library_books, 'పుస్తకాలు (Books)'),
                _menuItem(Icons.question_answer, 'Q&A'),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Version 1.0.0', style: TextStyle(color: Colors.grey)),
          )
        ],
      ),
    );
  }

  // Side Menu Item Helper
  Widget _menuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      onTap: () {
        // Future navigation logic here
      },
    );
  }

  // 3. MAIN NAVIGATION BUTTONS (GRID) UI
  Widget _buildNavigationGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1, // కార్డ్స్ షేప్ అడ్జస్ట్ చేయడానికి
        children: [
          _navCard('బైబిల్', Icons.menu_book, Colors.brown, () {}),
          _navCard('మ్యూజిక్', Icons.music_note, Colors.purple, () {}),
          _navCard('బుక్స్', Icons.book, Colors.orange, () {}),
          _navCard('Project H', Icons.work, Colors.teal, () {}),
        ],
      ),
    );
  }

  // Grid Card Helper
  Widget _navCard(String title, IconData icon, Color color, VoidCallback onTap) {
    return Card(
      elevation: 4,
      shadowColor: color.withOpacity(0.4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.1), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 40, color: color),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
