import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      // --- Side Menu (Drawer) ---
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('WOG Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(leading: const Icon(Icons.login), title: const Text('లాగిన్ (Login)'), onTap: (){}),
            ListTile(leading: const Icon(Icons.contact_mail), title: const Text('కాంటాక్ట్ (Contact)'), onTap: (){}),
            ListTile(leading: const Icon(Icons.library_books), title: const Text('పుస్తకాలు (Books)'), onTap: (){}),
            ListTile(leading: const Icon(Icons.question_answer), title: const Text('Q&A'), onTap: (){}),
          ],
        ),
      ),
      // --- Navigation Buttons (Grid) ---
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildCard('బైబిల్ (Bible)', Icons.menu_book, Colors.brown),
            _buildCard('మ్యూజిక్ (Music)', Icons.music_note, Colors.purple),
            _buildCard('బుక్స్ (Books)', Icons.book, Colors.orange),
            _buildCard('Project H', Icons.work, Colors.teal),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, IconData icon, Color color) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {}, // తదుపరి ఫీచర్లు ఇక్కడ లింక్ చేద్దాం
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}