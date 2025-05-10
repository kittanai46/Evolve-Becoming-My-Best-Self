// widgets/registration_form.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/registration_model.dart';
import '../utils/validators.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers สำหรับเก็บข้อมูล
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  // แสดงข้อมูลที่กรอกเมื่อกดยืนยัน
  void _showRegistrationInfo() {
    final RegistrationModel registration = RegistrationModel(
      name: _nameController.text,
      surname: _surnameController.text,
      address: _addressController.text,
      phone: _phoneController.text,
      email: _emailController.text,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ข้อมูลการสมัครสมาชิก'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    'ชื่อ-นามสกุล: ${registration.name} ${registration.surname}'),
                const SizedBox(height: 8),
                Text('ที่อยู่: ${registration.address}'),
                const SizedBox(height: 8),
                Text('เบอร์โทรศัพท์: ${registration.phone}'),
                const SizedBox(height: 8),
                Text('อีเมล: ${registration.email}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _isSubmitting = false;
                });
              },
              child: const Text('ตกลง'),
            ),
          ],
        );
      },
    );
  }

  // ส่งข้อมูลการสมัคร
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      // จำลองการส่งข้อมูล (delay เล็กน้อย)
      Future.delayed(const Duration(seconds: 1), () {
        _showRegistrationInfo();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ชื่อ
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'ชื่อ *',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
              filled: true,
              fillColor: Colors.white,
            ),
            validator: (value) =>
                Validators.validateNotEmpty(value, 'กรุณากรอกชื่อ'),
          ),
          const SizedBox(height: 16),

          // นามสกุล
          TextFormField(
            controller: _surnameController,
            decoration: const InputDecoration(
              labelText: 'นามสกุล *',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person_outline),
              filled: true,
              fillColor: Colors.white,
            ),
            validator: (value) =>
                Validators.validateNotEmpty(value, 'กรุณากรอกนามสกุล'),
          ),
          const SizedBox(height: 16),

          // ที่อยู่
          TextFormField(
            controller: _addressController,
            decoration: const InputDecoration(
              labelText: 'ที่อยู่ *',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.home),
              alignLabelWithHint: true,
              filled: true,
              fillColor: Colors.white,
            ),
            maxLines: 3,
            validator: (value) =>
                Validators.validateNotEmpty(value, 'กรุณากรอกที่อยู่'),
          ),
          const SizedBox(height: 16),

          // เบอร์โทรศัพท์
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: 'เบอร์โทรศัพท์ *',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.phone),
              hintText: '0xxxxxxxxx',
              filled: true,
              fillColor: Colors.white,
            ),
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
            validator: (value) => Validators.validatePhone(value),
          ),
          const SizedBox(height: 16),

          // อีเมล
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'อีเมล *',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
              hintText: 'example@email.com',
              filled: true,
              fillColor: Colors.white,
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) => Validators.validateEmail(value),
          ),
          const SizedBox(height: 32),

          // ปุ่มสมัครสมาชิก
          ElevatedButton(
            onPressed: _isSubmitting ? null : _submitForm,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              textStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
            ),
            child: _isSubmitting
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Text('สมัครสมาชิก'),
          ),
          // พื้นที่ว่างด้านล่าง
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
