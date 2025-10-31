import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo.dart';
import '../providers/todo_provider.dart';

class TodoTile extends ConsumerWidget {
  final Todo todo;
  final VoidCallback? onTap;

  const TodoTile({super.key, required this.todo, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(todo.title, style: TextStyle(decoration: todo.done ? TextDecoration.lineThrough : null)),
      subtitle: todo.description.isNotEmpty ? Text(todo.description) : null,
      leading: Checkbox(
        value: todo.done,
        onChanged: (v) async {
          final updated = todo.copyWith(done: v ?? false);
          await ref.read(todoListProvider.notifier).update(updated);
        },
      ),
      onTap: onTap,
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.redAccent),
        onPressed: () => ref.read(todoListProvider.notifier).delete(todo.id),
      ),
    );
  }
}
