import 'package:flutter/material.dart';


class AnswerButton extends StatelessWidget {
final String label;
final VoidCallback onTap;
final Color? color;
const AnswerButton({super.key, required this.label, required this.onTap, this.color});


@override
Widget build(BuildContext context) {
return ElevatedButton(
onPressed: onTap,
style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), minimumSize: const Size.fromHeight(48)),
child: Text(label, textAlign: TextAlign.center),
);
}
}