import 'package:flutter/material.dart';
import 'dart:async';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 2 సెకన్ల తర్వాత Home Screen కి వెళ్తుంది
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Text(
          'WORLD OF GOD\n(WOG)',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32, 
            fontWeight: FontWeight.bold, 
            color: Colors.white
          ),
        ),
      ),
    );
  }
}