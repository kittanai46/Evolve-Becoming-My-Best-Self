import 'package:flutter/material.dart';

import '../app_widgets/grade_input.dart';
import '../app_widgets/result_card.dart';
import '../utils/grade_calculator.dart';

class GradeCalculatorScreen extends StatefulWidget {
  const GradeCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<GradeCalculatorScreen> createState() => _GradeCalculatorScreenState();
}

class _GradeCalculatorScreenState extends State<GradeCalculatorScreen> {
  // ตัวแปรสำหรับเก็บค่าคะแนนแต่ละวิชา
  final TextEditingController _thaiController = TextEditingController();
  final TextEditingController _mathController = TextEditingController();
  final TextEditingController _scienceController = TextEditingController();
  final TextEditingController _englishController = TextEditingController();

  // ตัวแปรสำหรับเก็บผลลัพธ์
  List<Map<String, dynamic>> _results = [];
  bool _isResultShown = false;

  // ฟังก์ชันตรวจสอบคะแนนและคำนวณเกรด
  void _checkGrades() {
    // ตรวจสอบว่ากรอกข้อมูลครบหรือไม่
    if (_thaiController.text.isEmpty ||
        _mathController.text.isEmpty ||
        _scienceController.text.isEmpty ||
        _englishController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      double thaiScore = double.parse(_thaiController.text);
      double mathScore = double.parse(_mathController.text);
      double scienceScore = double.parse(_scienceController.text);
      double englishScore = double.parse(_englishController.text);

      // ตรวจสอบว่าคะแนนอยู่ในช่วง 0-100 หรือไม่
      if (thaiScore < 0 ||
          thaiScore > 100 ||
          mathScore < 0 ||
          mathScore > 100 ||
          scienceScore < 0 ||
          scienceScore > 100 ||
          englishScore < 0 ||
          englishScore > 100) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('คะแนนต้องอยู่ระหว่าง 0-100'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // สร้างผลลัพธ์
      setState(() {
        _results = [
          {
            'subject': 'ภาษาไทย',
            'score': thaiScore,
            'grade': GradeCalculator.calculateGrade(thaiScore),
          },
          {
            'subject': 'คณิตศาสตร์',
            'score': mathScore,
            'grade': GradeCalculator.calculateGrade(mathScore),
          },
          {
            'subject': 'วิทยาศาสตร์',
            'score': scienceScore,
            'grade': GradeCalculator.calculateGrade(scienceScore),
          },
          {
            'subject': 'ภาษาอังกฤษ',
            'score': englishScore,
            'grade': GradeCalculator.calculateGrade(englishScore),
          },
        ];
        _isResultShown = true;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('กรุณากรอกคะแนนเป็นตัวเลขเท่านั้น'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // ล้างข้อมูลทั้งหมด
  void _clearAll() {
    setState(() {
      _thaiController.clear();
      _mathController.clear();
      _scienceController.clear();
      _englishController.clear();
      _results = [];
      _isResultShown = false;
    });
  }

  @override
  void dispose() {
    _thaiController.dispose();
    _mathController.dispose();
    _scienceController.dispose();
    _englishController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ระบบตัดเกรดนิสิตนักศึกษา'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ส่วนกรอกข้อมูล
              GradeInputForm(
                thaiController: _thaiController,
                mathController: _mathController,
                scienceController: _scienceController,
                englishController: _englishController,
                onCheckGrades: _checkGrades,
                onClearAll: _clearAll,
              ),

              // แสดงผลลัพธ์เมื่อกดตรวจสอบ
              if (_isResultShown)
                GradeResultCard(
                  results: _results,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
