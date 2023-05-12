class QuizQuestion {
  final String text;
  final List<String> answers;
  const QuizQuestion(this.text, this.answers);

  List<String> get shuffleList {
    final listShuffle = List.of(answers);
    listShuffle.shuffle();
    return listShuffle;
  }
}
