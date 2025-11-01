import 'package:bkapp/screens/quiz_result_screen.dart';
import 'package:flutter/material.dart';
import '../models/question.dart';

class ResultTryAgainScreen extends StatelessWidget {
  final int score;
  final int total;
 final List<Question> questions;
  final List<String?> userAnswers;

  const ResultTryAgainScreen({
    super.key,
    required this.score,
    required this.total,
    required this.questions,
    required this.userAnswers,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = ((score / total) * 100).toStringAsFixed(0);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Exam2.png', fit: BoxFit.cover),
          
              Text(
                "Keep Trying",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
          
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 68, 0, 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(246, 133, 133, 0.47),
                      blurRadius: 5,
                      spreadRadius: 8,
                    ),
                  ],
                ),
          
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 90,
                    vertical: 10,
                  ),
                  child: Text(
                    "$percentage%",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color:Colors.white,
                    ),
                  ),
                ),
              ),
          
              const SizedBox(height: 30),
              Text(
                "Dont give up!Practice  makes perfect. Try again to  improveyour score",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
          
              Container(
                  child:InkWell(
                  onTap: () => {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuizResultScreen(
                          questions: questions,
                          userAnswers: userAnswers,
                        ),
                      ),
                    ),
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Text(
                        'See Result Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                ),
                const SizedBox(height: 20),
          
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
      ),
    );
  }
}
