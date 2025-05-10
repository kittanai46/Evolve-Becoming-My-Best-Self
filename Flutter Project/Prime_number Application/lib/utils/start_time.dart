class Time {
  static Stopwatch startTimer() {
    return Stopwatch()..start();
  }

  static int stopTimer(Stopwatch stopwatch) {
    stopwatch.stop();
    return stopwatch.elapsedMicroseconds;
  }

  static String getTimeMessage(int microseconds) {
    return 'เวลาในการคำนวณ คือ: $microseconds ไมโครวินาที';
  }
}
