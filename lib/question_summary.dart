import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    print(summaryData);
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map(
                (e) => Row(
                  children: [
                    Text(
                      ((e['question_index'] as int) + 1).toString(),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(e['question'] as String),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(e['user_answer'] as String),
                          Text(e['question_answer'] as String),
                        ],
                      ),
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
