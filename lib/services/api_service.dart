import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';
import '../models/question.dart';

class ApiService {
  Future<List<Category>> fetchCategories() async {
    final url = Uri.parse("https://opentdb.com/api_category.php");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      List data = body["trivia_categories"];
      return data.map((e) => Category.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch categories");
    }
  }

  Future<List<Question>> fetchQuestions({
    required int amount,
    required int categoryId,
    String difficulty = "any",
    String type = "multiple",
  }) async {
    final queryParams = {
      "amount": amount.toString(),
      "category": categoryId.toString(),
    };

    if (difficulty.toLowerCase() != "any") {
      queryParams["difficulty"] = difficulty.toLowerCase();
    }

    if (type.toLowerCase() != "any") {
      queryParams["type"] = type.toLowerCase();
    }

    final uri = Uri.https("opentdb.com", "/api.php", queryParams);
  

    final response = await http.get(uri);
    final data = jsonDecode(response.body);

   

    if (data["response_code"] != 0) return [];

    List results = data["results"];
    print("Questions parsed: ${results.length}");
    return results.map((e) => Question.fromJson(e)).toList();
  }
}
