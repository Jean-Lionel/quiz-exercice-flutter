import 'package:adv_basics/data/question.dart';
import 'package:adv_basics/question_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chooseAnswer, required this.restartScreen});
  final List<String> chooseAnswer;
  final void Function() restartScreen;

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> result = [];

    for (var i = 0; i < chooseAnswer.length; i++) {
      print(i);
      result.add({
        'question_index': i,
        'question': questions[i].text,
        'question_answer': questions[i].answers[0],
        'user_answer': chooseAnswer[i],
      });
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final int totalQuestion = questions.length;
    final int correctAnswer = summaryData
        .where((x) => x['question_answer'] == x['user_answer'])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You answered $correctAnswer out of $totalQuestion questions correctly'),
            const SizedBox(
              height: 20,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: restartScreen,
              child: const Text('restart The Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
