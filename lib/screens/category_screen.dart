import 'package:bkapp/screens/config_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/category_provider.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  // Icon map → category name based on keywords
  IconData getCategoryIcon(String name) {
    name = name.toLowerCase();
    if (name.contains("science")) return Icons.science;
    if (name.contains("math")) return Icons.calculate;
    if (name.contains("computer")) return Icons.computer;
    if (name.contains("sports")) return Icons.sports_soccer;
    if (name.contains("history")) return Icons.history_edu;
    if (name.contains("music")) return Icons.music_note;
    if (name.contains("film")) return Icons.movie;
    if (name.contains("geography")) return Icons.public;
    if (name.contains("art")) return Icons.brush;
    if (name.contains("politics")) return Icons.how_to_vote;
    if (name.contains("anime") || name.contains("cartoon"))
      return Icons.animation;
    return Icons.category; // default icon
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryData = ref.watch(categoryProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFEFF4FF), // ✨ Soft Light Background
      appBar: AppBar(
        title: const Text(
          "Select Category",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        centerTitle: true,
      ),

      body: categoryData.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Error: $err")),
        data: (categories) => Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 column Grid
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
                    color: Colors.white,
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
                      Icon(icon, size: 45),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          cat.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
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
    );
  }
}
