import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/category.dart';
import 'quiz_screen.dart'; 

class ConfigScreen extends ConsumerStatefulWidget {
  final Category category;
  const ConfigScreen({super.key, required this.category});

  @override
  ConsumerState<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends ConsumerState<ConfigScreen> {
  int amount = 10;
  String difficulty = "Any";
  String type = "multiple";

  final List<String> difficulties = ["Any", "Easy", "Medium", "Hard"];
  final List<String> types = ["multiple", "boolean"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Configure: ${widget.category.name}")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Number of Questions:", style: TextStyle(fontWeight: FontWeight.bold)),
            Slider(
              value: amount.toDouble(),
              min: 1,
              max: 50,
              divisions: 49,
              label: "$amount",
              onChanged: (val) {
                setState(() {
                  amount = val.toInt();
                });
              },
            ),
            const SizedBox(height: 20),
            const Text("Difficulty:", style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: difficulty,
              items: difficulties.map((d) => DropdownMenuItem(value: d, child: Text(d))).toList(),
              onChanged: (val) {
                if (val != null) setState(() => difficulty = val);
              },
            ),
            const SizedBox(height: 20),
            const Text("Type:", style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: type,
              items: types.map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
              onChanged: (val) {
                if (val != null) setState(() => type = val);
              },
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                child: const Text("Start Quiz"),
                onPressed: () {
                 
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuizScreenConfig (
                        category: widget.category,
                        amount: amount,
                        difficulty: difficulty,
                        type: type,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
