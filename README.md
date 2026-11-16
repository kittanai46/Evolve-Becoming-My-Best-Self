# Project : Evolve — Becoming My Best Self

<p align="center">
  <b>Flutter Practice Collection</b><br>
  รวมโปรเจกต์ฝึกเขียน Flutter เพื่อพัฒนาทักษะทีละขั้น และเป็นคนที่เก่งกว่าตัวเองในเมื่อวาน
</p>

---

## About Project

Evolve — Becoming My Best Self เป็นคลังแบบฝึกหัดสำหรับพัฒนาทักษะการเขียนแอปด้วย Flutter และ Dart ผ่านงานขนาดเล็กที่มีเป้าหมายชัดเจน

แต่ละแอปฝึกคนละด้าน เช่นการรับและตรวจสอบข้อมูล การแยกสูตรคำนวณออกจาก UI การแสดงผลตาม State และการจัดโครงสร้างโค้ดให้แยกหน้าจอ Widget, Model และ Utility ออกจากกัน

ปัจจุบันมีสามโปรเจกต์ย่อย ได้แก่แอปตัดเกรด แอปตรวจจำนวนเฉพาะ และฟอร์มสมัครสมาชิก โดยแต่ละโฟลเดอร์เป็น Flutter Project แยกกัน มี `pubspec.yaml` และชุดแพลตฟอร์มของตนเอง

---

## Applications

### Calculate Grade Application

แอปคำนวณเกรดจากคะแนนรายวิชา เพื่อฝึกการรับค่าตัวเลข ตรวจความถูกต้อง และสรุปผลเป็นรายการ

- รับคะแนนภาษาไทย คณิตศาสตร์ วิทยาศาสตร์ และภาษาอังกฤษ
- ตรวจว่ากรอกครบและคะแนนอยู่ในช่วง 0–100
- แจ้งเตือนเมื่อข้อมูลไม่ใช่ตัวเลขหรืออยู่นอกช่วง
- คำนวณเกรดแยกแต่ละวิชาด้วย `GradeCalculator`
- ใช้ Widget แยกสำหรับช่องกรอกข้อมูลและการ์ดผลลัพธ์
- ล้างข้อมูลทั้งหมดเพื่อเริ่มคำนวณใหม่ได้

เกณฑ์ที่กำหนดไว้ในโค้ด:

| คะแนน | เกรด |
|---|---|
| 80–100 | A |
| 75 ถึงน้อยกว่า 80 | B+ |
| 70 ถึงน้อยกว่า 75 | B |
| 65 ถึงน้อยกว่า 70 | C+ |
| 60 ถึงน้อยกว่า 65 | C |
| 55 ถึงน้อยกว่า 60 | D+ |
| 50 ถึงน้อยกว่า 55 | D |
| ต่ำกว่า 50 | F |

เป็นเกณฑ์ตัวอย่างของแอปนี้ ไม่ได้คำนวณ GPA หรือเกรดเฉลี่ยสะสม

### Prime Number Application

แอปตรวจว่าจำนวนเต็มที่กรอกเป็นจำนวนเฉพาะหรือไม่ พร้อมแสดงเวลาที่ใช้ในการเรียกคำนวณ

- แปลงข้อความเป็นจำนวนเต็มและแจ้งเตือนเมื่อกรอกไม่ได้
- แสดงผลว่าเป็นหรือไม่เป็นจำนวนเฉพาะ
- แยกอัลกอริทึมไว้ใน `Calculator.prime()`
- ตัดกรณีจำนวนไม่เกิน 1 และจำนวนที่หารด้วย 2 หรือ 3 ลงตัวก่อน
- ตรวจตัวหารที่เป็นไปได้จนถึงรากที่สองของจำนวน
- ใช้ `Stopwatch` วัดเวลาและแสดงหน่วยไมโครวินาที
- มี State สำหรับกำลังคำนวณและผลลัพธ์

เวลาที่แสดงเป็นการวัดบนเครื่องที่รัน ไม่ใช่ผล Benchmark มาตรฐานสำหรับเปรียบเทียบอุปกรณ์

### Sign Up Application

ฟอร์มสมัครสมาชิกตัวอย่างสำหรับฝึก Form Validation และการจัดข้อมูลเป็น Model

- รับชื่อ นามสกุล ที่อยู่ เบอร์โทรศัพท์ และอีเมล
- ตรวจช่องบังคับและรูปแบบอีเมลผ่าน `email_validator`
- ตรวจเบอร์โทรศัพท์ด้วยรูปแบบตัวเลข 10 หลักที่เริ่มด้วย `06`–`09` ตาม Regular Expression ในโค้ด
- สร้าง `RegistrationModel` และมีเมธอดแปลงข้อมูลเป็น / จาก Map
- จำลองเวลาส่งข้อมูลหนึ่งวินาที แล้วแสดงข้อมูลที่กรอกใน Dialog

ขั้นตอนสมัครสมาชิกปัจจุบันเป็นการจำลองในแอป ยังไม่ได้ส่งข้อมูลไปยัง API หรือสร้างบัญชีในฐานข้อมูล

---

## Learning Topics

| ทักษะ | ตัวอย่างที่ใช้ฝึก |
|---|---|
| รับข้อมูลและ Validation | คะแนนรายวิชา จำนวนเต็ม และฟอร์มสมัครสมาชิก |
| จัดการ State | ผลคำนวณ Loading และสถานะกำลังส่งฟอร์ม |
| แยก Business Logic | Utility สำหรับตัดเกรดและตรวจจำนวนเฉพาะ |
| ใช้ Widget ซ้ำ | ช่องกรอกคะแนน การ์ดผลลัพธ์ และ Form |
| สร้าง Data Model | `RegistrationModel` พร้อม `toJson()` / `fromJson()` |
| จัดการ Controller | `TextEditingController` และการคืนทรัพยากรใน `dispose()` |

---

## Project Structure

```text
Evolve-Becoming-My-Best-Self/
└── Flutter Project/
    ├── Calculate_Grade Application/
    │   └── lib/
    │       ├── app_widgets/
    │       ├── screens/
    │       └── utils/
    ├── Prime_number Application/
    │   └── lib/
    │       ├── screens/
    │       └── utils/
    └── Sign_up Application/
        └── lib/
            ├── models/
            ├── screens/
            ├── utils/
            └── widgets/
```

---

## Technology Stack

- Flutter
- Dart
- Material Widgets
- Form / TextFormField และ TextEditingController
- StatefulWidget และ `setState`
- `dart:math` และ `Stopwatch`
- `email_validator` สำหรับ Sign Up Application

---

## Getting Started

ใช้ Flutter SDK ที่รองรับ Dart `>=3.4.4 <4.0.0` ตาม `pubspec.yaml` ของโปรเจกต์ย่อย แล้วเลือกเปิดแอปที่ต้องการ เช่น:

```bash
git clone https://github.com/kittanai46/Evolve-Becoming-My-Best-Self.git
cd "Evolve-Becoming-My-Best-Self/Flutter Project/Calculate_Grade Application"
flutter pub get
flutter run
```

หากต้องการเปิดแอปอื่น ให้เปลี่ยนไปยังโฟลเดอร์ `Prime_number Application` หรือ `Sign_up Application` แล้วติดตั้ง Dependency และรันจากโฟลเดอร์นั้น

แต่ละแอปทำงานแยกกัน ไม่ต้องเปิดทั้งสามโปรเจกต์พร้อมกัน และชื่อโฟลเดอร์มีช่องว่างจึงควรครอบ Path ด้วยเครื่องหมายคำพูดเมื่อใช้ Terminal

---

## Project Status

เป็นชุดแอปฝึกทักษะที่ทำงานกับข้อมูลในหน้าจอและหน่วยความจำเป็นหลัก ไม่มีระบบ Backend ร่วมกัน เนื้อหา README อ้างอิงโค้ดของแต่ละโปรเจกต์ โดยยังไม่ได้ Build หรือทดสอบกับทุกแพลตฟอร์ม

---

## Repository Owner

[Kittanai Srikham](https://github.com/kittanai46)

