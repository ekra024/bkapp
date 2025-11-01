import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/category.dart';
import '../providers/question_provider.dart';
import 'result_awesome_screen.dart';
import 'result_try_again_screen.dart';
import '../models/question.dart';


class QuizScreenConfig extends ConsumerStatefulWidget {
  final Category category;
  final int amount;
  final String difficulty;
  final String type;

  const QuizScreenConfig({
    super.key,
    required this.category,
    required this.amount,
    required this.difficulty,
    required this.type,
  });

  @override
  ConsumerState<QuizScreenConfig> createState() => _QuizScreenConfigState();
}

class _QuizScreenConfigState extends ConsumerState<QuizScreenConfig> {
  int currentIndex = 0;
  List<String?> userAnswers = [];
  String? selectedAnswer;
  Timer? timer;
  int remainingSeconds = 10;
  final int totalSeconds = 10;

  // Store shuffled answers for each question (one-time shuffle)
  List<List<String>> shuffledAnswers = [];

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer(int totalQuestions) {
    timer?.cancel();
    remainingSeconds = totalSeconds;

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return; // safety check
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer?.cancel();
        // Time over → mark unanswered and go next
        if (!mounted) return;
        setState(() {
          userAnswers[currentIndex] = null;
          selectedAnswer = null;

          if (currentIndex < totalQuestions - 1) {
            currentIndex++;
            startTimer(totalQuestions);
          } else {
            goToResult();
          }
        });
      }
    });
  }

  void goToResult() {
    final questions = ref.read(
      questionProvider(
        QuestionParams(
          amount: widget.amount,
          categoryId: widget.category.id,
          difficulty: widget.difficulty.toLowerCase(),
          type: widget.type.toLowerCase(),
        )
      ),
    ).maybeWhen(data: (questions) => questions, orElse: () => []);

    if (questions.isEmpty) return;

    int correct = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] == questions[i].correctAnswer) {
        correct++;
      }
    }

    double percentage = (correct / questions.length) * 100;
   
    if (percentage >= 50) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              ResultAwesomeScreen(score: correct, total: questions.length,questions: questions.cast<Question>() , userAnswers: userAnswers),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              ResultTryAgainScreen(score: correct, total: questions.length, questions: questions.cast<Question>(),userAnswers: userAnswers),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final questionsAsyncValue = ref.watch(
      questionProvider(
        QuestionParams(
          amount: widget.amount,
          categoryId: widget.category.id,
          difficulty: widget.difficulty.toLowerCase(),
          type: widget.type.toLowerCase(),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(widget.category.name)),
      body: questionsAsyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Error: $err")),
        data: (questions) {
          if (questions.isEmpty) {
            return const Center(child: Text("No questions found"));
          }

          // Initialize userAnswers & shuffledAnswers only once
          if (userAnswers.isEmpty) {
            userAnswers = List<String?>.filled(questions.length, null);
            shuffledAnswers = questions.map((q) {
              final answers = [...q.incorrectAnswers, q.correctAnswer];
              answers.shuffle();
              return answers;
            }).toList();
            startTimer(questions.length);
          }

          final q = questions[currentIndex];
          final answers = shuffledAnswers[currentIndex];

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Timer + Linear progress
                LinearProgressIndicator(
                  value: remainingSeconds / totalSeconds,
                  backgroundColor: Colors.grey.shade300,
                  color: Colors.red,
                  minHeight: 8,
                ),
                const SizedBox(height: 8),
                Text(
                  "Time left: $remainingSeconds s",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.red),
                ),
                const SizedBox(height: 16),
                Text(
                  "Q${currentIndex + 1} of ${questions.length}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                // Question
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          q.question,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        // Options
                        ...answers.map(
                          (ans) => Card(
                            color: selectedAnswer == ans
                                ? Colors.blue[100]
                                : null,
                            child: ListTile(
                              title: Text(ans),
                              onTap: () {
                                setState(() {
                                  selectedAnswer = ans;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: selectedAnswer == null
                      ? null
                      : () {
                          timer?.cancel();
                          setState(() {
                            userAnswers[currentIndex] = selectedAnswer;
                            selectedAnswer = null;

                            if (currentIndex < questions.length - 1) {
                              currentIndex++;
                              startTimer(questions.length);
                            } else {
                              goToResult();
                            }
                          });
                        },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    currentIndex < questions.length - 1 ? "Next" : "Finish",
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
