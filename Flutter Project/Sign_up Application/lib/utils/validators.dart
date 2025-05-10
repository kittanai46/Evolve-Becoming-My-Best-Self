// utils/validators.dart
import 'package:email_validator/email_validator.dart';

class Validators {
  // ตรวจสอบค่าว่าง
  static String? validateNotEmpty(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    return null;
  }

  // ตรวจสอบรูปแบบอีเมล
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอกอีเมล';
    }
    if (!EmailValidator.validate(value)) {
      return 'กรุณากรอกอีเมลให้ถูกต้อง';
    }
    return null;
  }

  // ตรวจสอบรูปแบบเบอร์โทรศัพท์
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอกเบอร์โทรศัพท์';
    }

    // รูปแบบเบอร์โทรศัพท์มือถือไทย (10 หลัก)
    final RegExp regex = RegExp(r'^0[6-9][0-9]{8}$');
    if (!regex.hasMatch(value)) {
      return 'กรุณากรอกเบอร์โทรศัพท์ให้ถูกต้อง (0xxxxxxxxx)';
    }

    return null;
  }

  // สามารถเพิ่มฟังก์ชันตรวจสอบอื่นๆ ได้ตามต้องการ
}
