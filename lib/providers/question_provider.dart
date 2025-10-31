import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/question.dart';
import '../services/api_service.dart';

final apiServiceProvider = Provider((ref) => ApiService());

final questionProvider = FutureProvider.family<List<Question>, Map<String, dynamic>>(
  (ref, params) async {
    final apiService = ref.watch(apiServiceProvider);
    return await apiService.fetchQuestions(
      amount: params['amount'],
      categoryId: params['categoryId'], // ✅ note
      difficulty: params['difficulty'],
      type: params['type'],
    );
  },
);
