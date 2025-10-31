import '../models/todo.dart';

/// A tiny in-memory repository for Todo items. Not persistent — stored in a local variable.
class TodoRepository {
  final List<Todo> _todos = [];
  int _nextId = 1;

  Future<List<Todo>> getAll() async {
    // return a copy to avoid external mutation
    return List<Todo>.unmodifiable(_todos);
  }

  Future<Todo?> getById(int id) async {
    for (final t in _todos) {
      if (t.id == id) return t;
    }
    return null;
  }

  Future<Todo> add(Todo todo) async {
    final newTodo = todo.copyWith(id: _nextId++);
    _todos.add(newTodo);
    return newTodo;
  }

  Future<Todo?> update(Todo todo) async {
    final idx = _todos.indexWhere((t) => t.id == todo.id);
    if (idx == -1) return null;
    _todos[idx] = todo;
    return todo;
  }

  Future<bool> delete(int id) async {
    final before = _todos.length;
    _todos.removeWhere((t) => t.id == id);
    return _todos.length < before;
  }
}
