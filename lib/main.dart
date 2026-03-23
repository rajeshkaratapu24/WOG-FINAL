import 'package:flutter/material.dart';

void main() {
  runApp(const WogApp());
}

class WogApp extends StatelessWidget {
  const WogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WOG App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(), // Starts with the Entrance Logo
      debugShowCheckedModeBanner: false,
    );
  }
}

// --- ENTRANCE LOGO (SPLASH SCREEN) ---
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Waits 3 seconds, then goes to HomePage
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.church, size: 100, color: Colors.blue), // Placeholder for your logo
            SizedBox(height: 20),
            Text('WOG APP', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

// --- HOME PAGE (MENUS & BUTTONS) ---
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // The 4 main screens for the bottom buttons
  static const List<Widget> _bottomNavScreens = <Widget>[
    Center(child: Text('Full Bible Screen', style: TextStyle(fontSize: 24))),
    Center(child: Text('Songs Screen', style: TextStyle(fontSize: 24))),
    Center(child: Text('Books Screen', style: TextStyle(fontSize: 24))),
    Center(child: Text('Live Screen', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WOG App')),
      
      // SIDE MENU
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('WOG Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(leading: const Icon(Icons.track_changes), title: const Text('Tracker'), onTap: () {}),
            ListTile(leading: const Icon(Icons.audiotrack), title: const Text('Audio Messages'), onTap: () {}),
            ListTile(leading: const Icon(Icons.quiz), title: const Text('Quiz'), onTap: () {}),
            ListTile(leading: const Icon(Icons.contact_mail), title: const Text('Contact Us'), onTap: () {}),
            ListTile(leading: const Icon(Icons.info), title: const Text('About Us'), onTap: () {}),
            ListTile(leading: const Icon(Icons.share), title: const Text('Share This App'), onTap: () {}),
          ],
        ),
      ),

      // MAIN CONTENT AREA
      body: _bottomNavScreens.elementAt(_selectedIndex),

      // BOTTOM BUTTONS
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Full Bible'),
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Songs'),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Books'),
          BottomNavigationBarItem(icon: Icon(Icons.live_tv), label: 'Live'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
