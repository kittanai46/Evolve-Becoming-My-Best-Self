import 'package:flutter/material.dart';

import 'screens/grade_calculator_screen.dart';

void main() {
  runApp(const calculate_grade());
}

class calculate_grade extends StatelessWidget {
  const calculate_grade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ระบบตัดเกรดนิสิตนักศึกษา',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Kanit',
      ),
      home: const GradeCalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
