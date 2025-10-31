import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../models/question.dart';

// Immutable class for provider parameters
class QuestionParams {
  final int amount;
  final int categoryId;
  final String difficulty;
  final String type;

  QuestionParams({
    required this.amount,
    required this.categoryId,
    required this.difficulty,
    required this.type,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionParams &&
          runtimeType == other.runtimeType &&
          amount == other.amount &&
          categoryId == other.categoryId &&
          difficulty == other.difficulty &&
          type == other.type;

  @override
  int get hashCode => amount.hashCode ^ categoryId.hashCode ^ difficulty.hashCode ^ type.hashCode;
}

// FutureProvider.family
final questionProvider =
    FutureProvider.family<List<Question>, QuestionParams>((ref, params) async {
  print('Fetching questions with params: $params');

  final url =
      'https://opentdb.com/api.php?amount=${params.amount}&category=${params.categoryId}&difficulty=${params.difficulty}&type=${params.type}';
  final response = await http.get(Uri.parse(url));

  print('API response: ${response.body}');

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data['response_code'] == 0) {
      return (data['results'] as List)
          .map((q) => Question.fromJson(q))
          .toList();
    } else {
      return []; // no questions found
    }
  } else {
    throw Exception('Failed to fetch questions');
  }
});
