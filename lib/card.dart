import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  const Card({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Container(child: Text('Hello'))),
    );
  }
}
