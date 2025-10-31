import 'package:bkapp/screens/config_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/category_provider.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});


   IconData getCategoryIcon(String name) {
  name = name.toLowerCase();
  if (name.contains("general")) return Icons.lightbulb_outline;
  if (name.contains("books")) return Icons.menu_book;
  if (name.contains("film")) return Icons.movie;
  if (name.contains("music")) return Icons.music_note;
  if (name.contains("musicals")) return Icons.theater_comedy;
  if (name.contains("television")) return Icons.tv;
  if (name.contains("video games")) return Icons.sports_esports;
  if (name.contains("board games")) return Icons.grid_on;
  if (name.contains("science & nature")) return Icons.biotech;
  if (name.contains("science: computers")) return Icons.computer;
  if (name.contains("mathematics")) return Icons.calculate;
  if (name.contains("mythology")) return Icons.auto_awesome;
  if (name.contains("sports")) return Icons.sports_soccer;
  if (name.contains("geography")) return Icons.public;
  if (name.contains("history")) return Icons.history_edu;
  if (name.contains("politics")) return Icons.how_to_vote;
  if (name.contains("art")) return Icons.brush;
  if (name.contains("celebrities")) return Icons.star;
  if (name.contains("animals")) return Icons.pets;
  if (name.contains("vehicles")) return Icons.directions_car;
  if (name.contains("comics")) return Icons.menu_book_outlined;
  if (name.contains("gadgets")) return Icons.devices;
  if (name.contains("japanese anime")) return Icons.animation;
  if (name.contains("cartoon")) return Icons.child_care;
  return Icons.category;
}


 LinearGradient getCategoryGradient(String name) {
  name = name.toLowerCase();
  if (name.contains("general")) {
    return const LinearGradient(colors: [Colors.orange, Colors.deepOrange]);
  }
  if (name.contains("books")) {
    return const LinearGradient(colors: [Colors.blue, Colors.lightBlue]);
  }
  if (name.contains("film")) {
    return const LinearGradient(colors: [Colors.red, Colors.deepPurple]);
  }
  if (name.contains("music")) {
    return const LinearGradient(colors: [Colors.pink, Colors.purple]);
  }
  if (name.contains("video games")) {
    return const LinearGradient(colors: [Colors.green, Colors.teal]);
  }
  if (name.contains("science")) {
    return const LinearGradient(colors: [Colors.indigo, Colors.blue]);
  }
  if (name.contains("sports")) {
    return const LinearGradient(colors: [Colors.green, Colors.lightGreen]);
  }
  if (name.contains("geography")) {
    return const LinearGradient(colors: [Colors.teal, Colors.cyan]);
  }
  if (name.contains("history")) {
    return const LinearGradient(colors: [Colors.brown, Colors.orange]);
  }
  if (name.contains("politics")) {
    return const LinearGradient(colors: [Colors.deepPurple, Colors.blue]);
  }
  if (name.contains("animals")) {
    return const LinearGradient(colors: [Colors.orange, Colors.yellow]);
  }
  if (name.contains("vehicles")) {
    return const LinearGradient(colors: [Colors.blueGrey, Colors.black38]);
  }
  if (name.contains("art")) {
    return const LinearGradient(colors: [Colors.pinkAccent, Colors.amber]);
  }
  if (name.contains("cartoon") || name.contains("anime")) {
    return const LinearGradient(colors: [Colors.deepPurple, Colors.red]);
  }
  return const LinearGradient(colors: [Colors.grey, Colors.blueGrey]);
}



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryData = ref.watch(categoryProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFEFF4FF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            
            // ✅ Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Quizzical",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 4),

            // ✅ Subtitle
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Choose a category to focus on:",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w100
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: categoryData.when(
                loading: () =>
                    const Center(child: CircularProgressIndicator()),
                error: (err, _) =>
                    Center(child: Text("Error: $err")),
                data: (categories) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final cat = categories[index];
                      final icon = getCategoryIcon(cat.name);

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ConfigScreen(category: cat),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                             gradient: getCategoryGradient(cat.name),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                offset: const Offset(2, 4),
                                color: Colors.black.withOpacity(0.08),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(icon, size: 45, color: Colors.white),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  cat.name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                     color: Colors.white, 
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
