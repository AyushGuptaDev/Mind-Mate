import 'package:flutter/material.dart';
import 'package:mind_mate_project/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Mind Mate",
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lime),
      ),
      home: const LoginPage(),
    );
  }
}




