import 'package:flutter/material.dart';
// మీ రూల్ ప్రకారం UI ఫైల్స్ అన్నీ 'ui' ఫోల్డర్ లో ఉన్నాయి కాబట్టి పాత్ అప్‌డేట్ చేశాను.
import 'ui/splash_screen.dart'; 

void main() {
  runApp(const WogApp());
}

class WogApp extends StatelessWidget {
  const WogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WORLD OF GOD', // మీ ప్రాజెక్ట్ పేరు
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // ఇక్కడ const వాడాలంటే, పైన ఇంపోర్ట్ కరెక్ట్ గా ఉండాలి.
      home: const SplashScreen(), 
    );
  }
}