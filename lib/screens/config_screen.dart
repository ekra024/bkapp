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
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             
              // ✅ Category 
              //Image (Dummy or custom icon fallback)
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/Exam2.png",),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // ✅ App Heading
              Text(
                "Quizzical",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                 
                ),
              ),

              const SizedBox(height: 8),

              // ✅ Subtitle
              Text(
                "Configuration",
                style: TextStyle(
                  fontSize: 18,
                 
                ),
              ),
              const SizedBox(height: 12),

              // ✅ Category Name
              Text(
                widget.category.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              // ✅ Question Amount
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Number of Questions",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              Slider(
                value: amount.toDouble(),
                min: 1,
                max: 50,
                divisions: 49,
                label: "$amount",
                onChanged: (val) => setState(() => amount = val.toInt()),
              ),

              const SizedBox(height: 20),

              // ✅ Difficulty picker
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Difficulty",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              DropdownButton<String>(
                value: difficulty,
                isExpanded: true,
                items: difficulties
                    .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                    .toList(),
                onChanged: (val) => setState(() => difficulty = val!),
              ),

              const SizedBox(height: 20),

              // ✅ Type Picker
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Type",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              DropdownButton<String>(
                value: type,
                isExpanded: true,
                items: types
                    .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                    .toList(),
                onChanged: (val) => setState(() => type = val!),
              ),

              const SizedBox(height: 40),

              // ✅ Start Button 80% Width
              SizedBox(
                width: width * 0.8,
                child: ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuizScreenConfig(
                          category: widget.category,
                          amount: amount,
                          difficulty: difficulty,
                          type: type,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Start",
                    style: TextStyle(fontSize: 18,
                    color:Color.fromRGBO(0,70,67,1)),
                    
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
