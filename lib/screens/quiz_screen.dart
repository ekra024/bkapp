import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/category.dart';
import '../providers/question_provider.dart';

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

  @override
  Widget build(BuildContext context) {
    final questionsAsyncValue = ref.watch(
      questionProvider({
        'amount': widget.amount,
        'categoryId': widget.category.id,
        'difficulty': widget.difficulty.toLowerCase(),
        'type': widget.type.toLowerCase(),
      }),
    );

    return Scaffold(
      appBar: AppBar(title: Text(widget.category.name)),
      body: questionsAsyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Error: $err")),
        data: (questions) {
          if (questions.isEmpty) return const Center(child: Text("No questions found"));

          final q = questions[currentIndex];

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Q${currentIndex + 1}: ${q.question}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ...q.allAnswers.map(
                  (ans) => Card(
                    child: ListTile(
                      title: Text(ans),
                      onTap: () {
                        // Next question logic
                        if (currentIndex < questions.length - 1) {
                          setState(() {
                            currentIndex++;
                          });
                        } else {
                          // Quiz finished
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text("Quiz Finished!"),
                              content: const Text("You have reached the end."),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("OK"),
                                )
                              ],
                            ),
                          );
                        }
                      },
                    ),
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
