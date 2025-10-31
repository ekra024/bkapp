import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/todo_provider.dart';
import '../widgets/todo_tile.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({super.key});

  Future<void> _showAddDialog(BuildContext context, WidgetRef ref) async {
    final titleCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Todo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: titleCtrl, decoration: const InputDecoration(labelText: 'Title')),
            TextField(controller: descCtrl, decoration: const InputDecoration(labelText: 'Description')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () async {
              final title = titleCtrl.text.trim();
              if (title.isEmpty) return;
              final navigator = Navigator.of(context);
              await ref.read(todoListProvider.notifier).add(title, description: descCtrl.text.trim());
              navigator.pop();
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Todos (in-memory)')),
      body: todos.isEmpty
          ? const Center(child: Text('No todos yet. Tap + to add one.'))
          : RefreshIndicator(
              onRefresh: () => ref.read(todoListProvider.notifier).loadAll(),
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final t = todos[index];
                  return TodoTile(
                    todo: t,
                    onTap: () async {
                      // simple edit dialog
                      final titleCtrl = TextEditingController(text: t.title);
                      final descCtrl = TextEditingController(text: t.description);
                      await showDialog<void>(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Edit Todo'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(controller: titleCtrl, decoration: const InputDecoration(labelText: 'Title')),
                              TextField(controller: descCtrl, decoration: const InputDecoration(labelText: 'Description')),
                            ],
                          ),
                          actions: [
                            TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('Cancel')),
                            ElevatedButton(
                              onPressed: () async {
                                final edited = t.copyWith(title: titleCtrl.text.trim(), description: descCtrl.text.trim());
                                final navigator = Navigator.of(ctx);
                                await ref.read(todoListProvider.notifier).update(edited);
                                navigator.pop();
                              },
                              child: const Text('Save'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }
}
