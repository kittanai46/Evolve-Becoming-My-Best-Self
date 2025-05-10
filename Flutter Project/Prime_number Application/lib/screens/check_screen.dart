import 'package:flutter/material.dart';

import '../screens/widgets.dart';
import '../utils/calculator.dart';
import '../utils/start_time.dart';

class PrimeCheckerScreen extends StatefulWidget {
  const PrimeCheckerScreen({super.key});

  @override
  State<PrimeCheckerScreen> createState() => _PrimeCheckerScreenState();
}

class _PrimeCheckerScreenState extends State<PrimeCheckerScreen> {
  final controller = TextEditingController();
  String resultText = '';
  String time = '';
  bool isLoading = false;
  bool isPrime = false;
  bool hasResult = false;

// ตรวจสอบจำนวนเฉพาะ
  void _checkPrime() {
    setState(() => isLoading = true);

    Future.delayed(Duration.zero, () {
      try {
// แปลงข้อความเป็นตัวเลขและคำนวณ
        final number = int.parse(controller.text);
        final stopwatch = Time.startTimer();
        final isPrimeNumber = Calculator.prime(number);
        final duration = Time.stopTimer(stopwatch);

// รับค่าที่ได้จากการคำนวณพร้อมกับสถานะและเวลาที่ใช้
        setState(() {
          resultText = Calculator.getResultMessage(number);
          time = Time.getTimeMessage(duration);
          isPrime = isPrimeNumber;
          hasResult = true;
          isLoading = false;
        });
      } catch (e) {
// ดักบัคจากผู้ใช้
        setState(() {
          resultText = 'กรุณาใส่ตัวเลขให้ถูกต้อง';
          time = '';
          hasResult = true;
          isPrime = false;
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
// รูปภาพพื้นหลังส่วนล่าง
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/wallpaper_down.png',
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
// เนื้อหาแสดงข้อมูล
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  'ตรวจสอบเลขจำนวนเฉพาะ',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const Text(
                  'Prime Number Application',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 65),
// ช่องให้ผู้ใช้กรอกตัวเลขเข้ามา
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    labelText: 'กรุณากรอกตัวเลขที่ต้องการตรวจสอบ',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 40),

// ปุ่มตรวจสอบ
                ElevatedButton(
                  onPressed: isLoading ? null : _checkPrime,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5, // เงา
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('ตรวจสอบ', style: TextStyle(fontSize: 22)),
                ),
                const SizedBox(height: 20),
// แสดงค่า
                if (hasResult) _buildResultWidget(),
                // คำเตือน
                const Text(
                  'คำแนะนำ:กรุณากรอกตัวเลขจำนวนเต็ม',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// Widgetตอนแสดงผล
  Widget _buildResultWidget() {
    return time.isNotEmpty
        ? ResultDisplay(
            resultText: resultText,
            time: time,
            isPrime: isPrime,
          )
        : Text(
            resultText,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.red,
            ),
          );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
