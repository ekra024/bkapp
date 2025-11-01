import 'package:bkapp/screens/category_screen.dart';
import 'package:bkapp/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/category': (context) => CategoryScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
