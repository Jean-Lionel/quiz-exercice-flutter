import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function()? startQuiz;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: Colors.white38,
        ),
        const SizedBox(
          height: 100,
        ),
        const Center(
          child: Text(
            'Learn Flutter The Fun Way',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
          ),
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          icon: const Icon(
            Icons.arrow_right,
            size: 36,
          ),
          label: const Text(
            "Start Quiz",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}
