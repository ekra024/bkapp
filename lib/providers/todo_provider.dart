import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo.dart';
import '../repository/todo_repository.dart';

final todoRepositoryProvider = Provider<TodoRepository>((ref) => TodoRepository());

/// StateNotifier that holds a list of Todo and exposes CRUD methods.
class TodoListNotifier extends StateNotifier<List<Todo>> {
  final TodoRepository repository;

  TodoListNotifier(this.repository) : super([]) {
    // initial load
    loadAll();
  }

  Future<void> loadAll() async {
    final items = await repository.getAll();
    state = items;
  }

  Future<Todo?> getById(int id) => repository.getById(id);

  Future<void> add(String title, {String description = ''}) async {
    final t = Todo(id: 0, title: title, description: description);
    final added = await repository.add(t);
    state = [...state, added];
  }

  Future<void> update(Todo todo) async {
    final updated = await repository.update(todo);
    if (updated == null) return;
    state = state.map((t) => t.id == updated.id ? updated : t).toList();
  }

  Future<void> delete(int id) async {
    final ok = await repository.delete(id);
    if (!ok) return;
    state = state.where((t) => t.id != id).toList();
  }
}

final todoListProvider = StateNotifierProvider<TodoListNotifier, List<Todo>>(
  (ref) => TodoListNotifier(ref.read(todoRepositoryProvider)),
);
