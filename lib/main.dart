import 'package:flutter/material.dart';
import 'package:iwork_project/screens/auth_screen.dart';
import 'package:iwork_project/screens/auth_screen2.dart';
import 'package:iwork_project/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthScreen(),
    );
  }
}
