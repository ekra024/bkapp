import 'package:flutter/material.dart';


class LinearProgress extends StatelessWidget {
final double value; // 0..1
const LinearProgress({super.key, required this.value});


@override
Widget build(BuildContext context) {
return SizedBox(
height: 8,
child: ClipRRect(
borderRadius: BorderRadius.circular(6),
child: LinearProgressIndicator(value: value, minHeight: 8),
),
);
}
}