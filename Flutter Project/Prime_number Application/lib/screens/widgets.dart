import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  final String resultText;
  final String time;
  final bool isPrime;

  const ResultDisplay({
    super.key,
    required this.resultText,
    required this.time,
    required this.isPrime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isPrime ? Colors.green[100] : Colors.red[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            resultText,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isPrime ? Colors.green[800] : Colors.red[800],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            time,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
