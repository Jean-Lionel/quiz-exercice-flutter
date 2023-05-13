import 'package:adv_basics/data/question.dart';
import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map(
                (e) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      child: Text(
                        ((e['question_index'] as int) + 1).toString(),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            e['question'] as String,
                            style: const TextStyle(
                              color: Color(0xF3F3C83B),
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: questions[(e['question_index'] as int)]
                                .answers
                                .map(
                                  (data) => TextAnswer(
                                      data,
                                      (e['question_answer'] == data),
                                      (e['question_answer'] ==
                                          e['user_answer'])),
                                )
                                .toList(),
                          ),
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

  Widget TextAnswer(e, bool user_answer, bool correctAnswer) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Text(
        e,
        style: TextStyle(
          fontSize: 17,
          color: user_answer
              ? (correctAnswer ? Colors.green : Colors.white)
              : Colors.deepOrange,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
