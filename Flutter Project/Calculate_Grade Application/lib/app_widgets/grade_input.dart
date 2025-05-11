import 'package:flutter/material.dart';

class GradeInputForm extends StatelessWidget {
  final TextEditingController thaiController;
  final TextEditingController mathController;
  final TextEditingController scienceController;
  final TextEditingController englishController;
  final VoidCallback onCheckGrades;
  final VoidCallback onClearAll;

  const GradeInputForm({
    Key? key,
    required this.thaiController,
    required this.mathController,
    required this.scienceController,
    required this.englishController,
    required this.onCheckGrades,
    required this.onClearAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'กรอกคะแนนแต่ละวิชา (0-100)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildScoreTextField('ภาษาไทย', thaiController),
            const SizedBox(height: 12),
            _buildScoreTextField('คณิตศาสตร์', mathController),
            const SizedBox(height: 12),
            _buildScoreTextField('วิทยาศาสตร์', scienceController),
            const SizedBox(height: 12),
            _buildScoreTextField('ภาษาอังกฤษ', englishController),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onCheckGrades,
                    icon: const Icon(Icons.calculate),
                    label: const Text(
                      'ตรวจสอบเกรด',
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: onClearAll,
                  icon: const Icon(Icons.refresh),
                  label: const Text('ล้างข้อมูล'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // สร้าง TextField สำหรับกรอกคะแนน
  Widget _buildScoreTextField(
      String subject, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: subject,
        border: const OutlineInputBorder(),
        suffixText: 'คะแนน',
      ),
    );
  }
}
