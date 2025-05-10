// screens/registration_screen.dart
import 'package:flutter/material.dart';

import '../widgets/registration_form.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/wallpaper_down.png'),
            alignment: Alignment.bottomCenter,
            fit: BoxFit.contain,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 25),
                  // โลโก้
                  Center(
                    child: Image.asset(
                      'assets/Logo.png',
                      height: 120,
                      width: 120,
                    ),
                  ),

                  // หัวข้อฟอร์ม
                  const SizedBox(height: 15),
                  const Text(
                    'ยินดีต้อนรับสู่แอปพลิเคชัน',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'กรุณากรอกข้อมูลเพื่อสมัครสมาชิก',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),

                  // แบบฟอร์มลงทะเบียน
                  const RegistrationForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
