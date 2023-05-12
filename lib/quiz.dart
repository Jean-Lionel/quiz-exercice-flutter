import 'package:adv_basics/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color(0xff1f005c),
              Color(0xff5b0060),
              Color(0xff870160),
              Color(0xffac255e),
              Color(0xffca485c),
              Color(0xffe16b5c),
            ], // Gradient from https://learnui.design/tools/gradient-generator.html
            tileMode: TileMode.mirror,
          ),
        ),
        child: activeScreen == 'start-screen'
            ? StartScreen(switchScreen)
            : const QuestionScreen(),
      ),
    ));
  }
}
