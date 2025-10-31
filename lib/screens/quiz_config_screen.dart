import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/quiz_provider.dart';
import 'quiz_screen.dart';

class QuizConfigScreen extends StatefulWidget {
  final String categoryId;
  final String categoryName;
  const QuizConfigScreen({super.key, required this.categoryId, required this.categoryName});

  @override
  State<QuizConfigScreen> createState() => _QuizConfigScreenState();
}

class _QuizConfigScreenState extends State<QuizConfigScreen> {
  int amount = 10;
  String difficulty = '';
  String type = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Configure Quiz")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Amount slider
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Number of Questions"),
                Text("$amount"),
              ],
            ),
            Slider(
              value: amount.toDouble(),
              min: 1,
              max: 50,
              divisions: 49,
              label: "$amount",
              onChanged: (val) {
                setState(() => amount = val.toInt());
              },
            ),
            const SizedBox(height: 20),

            // Difficulty dropdown
            DropdownButtonFormField<String>(
              value: difficulty.isEmpty ? null : difficulty,
              hint: const Text("Select Difficulty"),
              items: const [
                DropdownMenuItem(value: '', child: Text("Any")),
                DropdownMenuItem(value: 'easy', child: Text("Easy")),
                DropdownMenuItem(value: 'medium', child: Text("Medium")),
                DropdownMenuItem(value: 'hard', child: Text("Hard")),
              ],
              onChanged: (val) {
                setState(() => difficulty = val ?? '');
              },
            ),
            const SizedBox(height: 20),

            // Type dropdown
            DropdownButtonFormField<String>(
              value: type.isEmpty ? null : type,
              hint: const Text("Select Type"),
              items: const [
                DropdownMenuItem(value: '', child: Text("Any")),
                DropdownMenuItem(value: 'multiple', child: Text("Multiple Choice")),
                DropdownMenuItem(value: 'boolean', child: Text("True / False")),
              ],
              onChanged: (val) {
                setState(() => type = val ?? '');
              },
            ),
            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () async {
                final quizNotifier = context.read(quizProvider.notifier);
                await quizNotifier.fetchQuestions(
                  amount: amount,
                  category: widget.categoryId,
                  difficulty: difficulty,
                  type: type,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const QuizScreen()),
                );
              },
              child: const Text("Start Quiz"),
            )
          ],
        ),
      ),
    );
  }
}
