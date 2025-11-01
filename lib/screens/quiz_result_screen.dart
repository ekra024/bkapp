import 'package:flutter/material.dart';
import '../models/question.dart';

class QuizResultScreen extends StatelessWidget {
  final List<Question> questions;
  final List<String?> userAnswers;

  const QuizResultScreen({
    super.key,
    required this.questions,
    required this.userAnswers,
  });

  @override
  Widget build(BuildContext context) {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] == questions[i].correctAnswer) score++;
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Quiz Result")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Your Score: $score / ${questions.length}",
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final q = questions[index];
                  final userAns = userAnswers[index];
                  return Card(
                    color: userAns == q.correctAnswer
                        ? Colors.green[100]
                        : Colors.red[100],
                    child: ListTile(
                      title: Text(q.question),
                      subtitle: Text(
                        "Your Answer: $userAns\nCorrect Answer: ${q.correctAnswer}",
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20),
             InkWell(
                onTap: () => {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/category',
                    (route) => false,
                  ),
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(2, 112, 107, 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 80,
                      vertical: 15,
                    ),
                    child: Text(
                      'PLAY AGAIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
}
