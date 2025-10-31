// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../models/question_model.dart';
// import '../services/api_service.dart';

// final quizProvider = StateNotifierProvider<QuizNotifier, QuizState>((ref) {
//   return QuizNotifier();
// });

// class QuizState {
//   final List<Question> questions;
//   final int currentIndex;
//   final int score;
//   final bool isLoading;

//   QuizState({
//     this.questions = const [],
//     this.currentIndex = 0,
//     this.score = 0,
//     this.isLoading = true,
//   });

//   QuizState copyWith({
//     List<Question>? questions,
//     int? currentIndex,
//     int? score,
//     bool? isLoading,
//   }) {
//     return QuizState(
//       questions: questions ?? this.questions,
//       currentIndex: currentIndex ?? this.currentIndex,
//       score: score ?? this.score,
//       isLoading: isLoading ?? this.isLoading,
//     );
//   }
// }

// class QuizNotifier extends StateNotifier<QuizState> {
//   QuizNotifier() : super(QuizState());

//   final ApiService _apiService = ApiService();

//   Future<void> loadQuestions({int amount = 10, String category = ""}) async {
//     state = state.copyWith(isLoading: true);
//     try {
//       final questions = await _apiService.fetchQuestions(amount: amount, category: categoryId);
//       state = state.copyWith(questions: questions, isLoading: false, currentIndex: 0, score: 0);
//     } catch (e) {
//       state = state.copyWith(isLoading: false);
//       rethrow;
//     }
//   }

//   void answerQuestion(String answer) {
//     if (state.questions[state.currentIndex].correctAnswer == answer) {
//       state = state.copyWith(score: state.score + 1);
//     }
//     if (state.currentIndex < state.questions.length - 1) {
//       state = state.copyWith(currentIndex: state.currentIndex + 1);
//     }
//   }
// }
