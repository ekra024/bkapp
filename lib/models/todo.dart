// Simple Todo model
class Todo {
  final int id;
  final String title;
  final String description;
  final bool done;
  final DateTime createdAt;

  Todo({
    required this.id,
    required this.title,
    this.description = '',
    this.done = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Todo copyWith({
    int? id,
    String? title,
    String? description,
    bool? done,
    DateTime? createdAt,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      done: done ?? this.done,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'done': done,
        'createdAt': createdAt.toIso8601String(),
      };

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: (json['id'] as num).toInt(),
        title: json['title'] as String? ?? '',
        description: json['description'] as String? ?? '',
        done: json['done'] as bool? ?? false,
        createdAt: DateTime.tryParse(json['createdAt'] as String? ?? '') ?? DateTime.now(),
      );
}
