class Question {
  final String type;
  final String difficulty;
  final String category;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;
  late final List<String> allAnswers;

  Question({
    required this.type,
    required this.difficulty,
    required this.category,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  }) {
    // Shuffle answers
    allAnswers = List<String>.from(incorrectAnswers)..add(correctAnswer);
    allAnswers.shuffle();
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      type: json['type'],
      difficulty: json['difficulty'],
      category: json['category'],
      question: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswers: List<String>.from(json['incorrect_answers']),
    );
  }
}
