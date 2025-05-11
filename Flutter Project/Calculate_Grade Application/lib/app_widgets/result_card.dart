import 'package:flutter/material.dart';

import '../utils/grade_color.dart';

class GradeResultCard extends StatelessWidget {
  final List<Map<String, dynamic>> results;

  const GradeResultCard({
    Key? key,
    required this.results,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Card(
        elevation: 4,
        color: Colors.blue.shade50,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ผลการเรียน',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Divider(),
              ...List.generate(results.length, (index) {
                final result = results[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          result['subject'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'คะแนน: ${result['score']}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: GradeColor.getGradeColor(result['grade']),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'เกรด: ${result['grade']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
