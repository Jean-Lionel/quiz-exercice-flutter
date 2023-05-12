import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/question.dart';
import 'package:adv_basics/models/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentIndex = 0;

  void nextQuestion() {
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    QuizQuestion currentQuestion = questions[currentIndex];
    if (currentQuestion.answers.length == currentIndex) {
      setState(() {
        currentIndex = 0;
      });
    }

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.shuffleList.map(
              (answer) => AnswerButton(
                text: answer,
                onTap: nextQuestion,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
