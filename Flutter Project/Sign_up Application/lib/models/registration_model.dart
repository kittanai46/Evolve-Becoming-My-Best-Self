// models/registration_model.dart
class RegistrationModel {
  final String name;
  final String surname;
  final String address;
  final String phone;
  final String email;

  RegistrationModel({
    required this.name,
    required this.surname,
    required this.address,
    required this.phone,
    required this.email,
  });

  // แปลงข้อมูลเป็น Map สำหรับการส่งข้อมูลไปยัง API หรือฐานข้อมูล
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'address': address,
      'phone': phone,
      'email': email,
    };
  }

  // สร้างข้อมูลจาก Map สำหรับรับข้อมูลจาก API หรือฐานข้อมูล
  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    return RegistrationModel(
      name: json['name'] ?? '',
      surname: json['surname'] ?? '',
      address: json['address'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
