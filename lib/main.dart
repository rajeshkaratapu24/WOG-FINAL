import 'package:flutter/material.dart';
import 'ui/home_screen.dart'; // పాత్ మార్చాము

void main() {
  runApp(const WogApp());
}

class WogApp extends StatelessWidget {
  const WogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WORLD OF GOD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}