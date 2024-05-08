import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:macro_vision_1/presentations/screens/login_screen.dart';
import 'package:macro_vision_1/presentations/screens/main_screen.dart';
import 'package:macro_vision_1/auth/keys.dart';

void main() {
  Gemini.init(apiKey: apikey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Materia App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
