import 'package:flutter/material.dart';
import '../features/bible/ui/bible_screen.dart'; // కొత్త ఫోల్డర్ పాత్

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: _buildAppBar(context),
      drawer: _buildSideMenu(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              _buildDailyVerseCard(),
              const SizedBox(height: 16),
              _buildNotificationsCard(),
              const SizedBox(height: 16),
              _buildLiveCard(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white, size: 32),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Text(
            'WOG',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'serif',
              letterSpacing: 2.0,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildDailyVerseCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF1E1B4B)], 
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 10, offset: const Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'DAILY VERSE',
                style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'serif', letterSpacing: 1.5),
              ),
              Icon(Icons.menu_book, color: Colors.white, size: 28),
            ],
          ),
          const SizedBox(height: 30),
          const Center(
            child: Text(
              'యెహోవా నా కాపరి',
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              '- కీర్తనలు 1:1',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Color(0xFF450A0A), Color(0xFF1A0505)], 
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 10, offset: const Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'NOTIFICATIONS',
                style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'serif', letterSpacing: 1.5),
              ),
              Icon(Icons.notifications_none, color: Colors.white, size: 28),
            ],
          ),
          const SizedBox(height: 30),
          const Center(
            child: Text(
              'ఈరోజు లైవ్ లో ప్రార్థనలు జరుగుతాయి.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildLiveCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Color(0xFF262626), Color(0xFF171717)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 8),
                  const Text('LIVE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Evening Fellowship & Prayer',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          const Text(
            'Join our daily live session with the community.\nConnect directly via Jitsi.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Color(0xFF0A0A0A), 
        border: Border(top: BorderSide(color: Colors.white12, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(icon: const Icon(Icons.library_books_outlined, color: Colors.grey, size: 28), onPressed: () {}),
          IconButton(
            icon: const Icon(Icons.menu_book_outlined, color: Colors.grey, size: 28), 
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BibleScreen()),
              );
            },
          ),
          IconButton(icon: const Icon(Icons.home, color: Colors.white, size: 32), onPressed: () {}),
          IconButton(icon: const Icon(Icons.album_outlined, color: Colors.grey, size: 28), onPressed: () {}),
          IconButton(icon: const Icon(Icons.manage_accounts_outlined, color: Colors.grey, size: 28), onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildSideMenu() {
    return Drawer(
      backgroundColor: const Color(0xFF1E1E1E),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            child: Text('WOG Menu', style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'serif')),
          ),
          _menuItem(Icons.login, 'లాగిన్ (Login)'),
          _menuItem(Icons.contact_mail, 'కాంటాక్ట్ (Contact)'),
          _menuItem(Icons.library_books, 'పుస్తకాలు (Books)'),
          _menuItem(Icons.question_answer, 'Q&A'),
        ],
      ),
    );
  }

  Widget _menuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {},
    );
  }
}