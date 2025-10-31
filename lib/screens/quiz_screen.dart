import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/category.dart';
import '../providers/question_provider.dart';
import 'quiz_result_screen.dart';

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

          // initialize userAnswers list
          if (userAnswers.isEmpty) {
            userAnswers = List<String?>.filled(questions.length, null);
          }

          final q = questions[currentIndex];

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                "Q${currentIndex + 1}: ${q.question}",
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ...q.allAnswers.map(
                (ans) => Card(
                  color: userAnswers[currentIndex] == ans
                      ? Colors.blue[100]
                      : null,
                  child: ListTile(
                    title: Text(ans),
                    onTap: () {
                      setState(() {
                        userAnswers[currentIndex] = ans;
                        if (currentIndex < questions.length - 1) {
                          currentIndex++;
                        } else {
                          // navigate to result screen
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => QuizResultScreen(
                                questions: questions,
                                userAnswers: userAnswers,
                              ),
                            ),
                          );
                        }
                      });
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
