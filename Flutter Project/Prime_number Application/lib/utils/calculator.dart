import 'dart:math';

//คำนวณเลขจำนวนเฉพาะ
class Calculator {
  static bool prime(int num) {
    if (num <= 1) return false;
    if (num <= 3) return true;
    if (num % 2 == 0 || num % 3 == 0) return false;

    int sqrtnum = sqrt(num).floor();
    for (int i = 5; i <= sqrtnum; i += 6) {
      if (num % i == 0 || num % (i + 2) == 0) return false;
    }

    return true;
  }

//นำค่ามาแสดง
  static String getResultMessage(int num) {
    bool isprime = prime(num);

    String status = isprime ? 'เป็นจำนวนเฉพาะ' : 'ไม่เป็นจำนวนเฉพาะ';

    return ' $num  $status';
  }
}
