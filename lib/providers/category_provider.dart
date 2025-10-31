import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/category.dart';
import '../services/api_service.dart';

final apiServiceProvider = Provider((ref) => ApiService());

final categoryProvider = FutureProvider<List<Category>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return await apiService.fetchCategories();
});
