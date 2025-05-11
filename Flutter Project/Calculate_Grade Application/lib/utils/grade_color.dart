import 'package:flutter/material.dart';

class GradeColor {
  static Color getGradeColor(String grade) {
    switch (grade) {
      case 'A':
        return Colors.green.shade700;
      case 'B+':
        return Colors.green;
      case 'B':
        return Colors.teal;
      case 'C+':
        return Colors.blue;
      case 'C':
        return Colors.blue.shade300;
      case 'D+':
        return Colors.orange;
      case 'D':
        return Colors.deepOrange;
      case 'F':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
