import 'package:flutter/material.dart';
import 'package:macro_vision_1/presentations/views/login_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int selectedNavBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Macro Vision',
                style: TextStyle(
                    color: Colors.white, fontStyle: FontStyle.italic)),
          ),
          backgroundColor: colors.primary,
        ),
        body: const LoginView());
  }
}
