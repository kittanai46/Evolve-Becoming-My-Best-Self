import 'package:flutter/material.dart';

import 'screens/check_screen.dart';

void main() {
  runApp(const PrimeCheckerApp());
}

class PrimeCheckerApp extends StatelessWidget {
  const PrimeCheckerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrimeCheckerScreen(),
    );
  }
}
