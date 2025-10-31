import 'package:flutter/material.dart';
import '../models/category_model.dart';


class CategoryCard extends StatelessWidget {
final Category category;
final VoidCallback onTap;
const CategoryCard({super.key, required this.category, required this.onTap});


@override
Widget build(BuildContext context) {
final color = Colors.primaries[category.id % Colors.primaries.length].shade300;
return InkWell(
onTap: onTap,
borderRadius: BorderRadius.circular(12),
child: Container(
padding: const EdgeInsets.all(12),
decoration: BoxDecoration(
color: color,
borderRadius: BorderRadius.circular(12),
),
child: Center(
child: Text(
category.name,
textAlign: TextAlign.center,
style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
),
),
),
);
}
}