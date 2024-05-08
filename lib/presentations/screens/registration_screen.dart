import 'package:flutter/material.dart';
import 'package:macro_vision_1/presentations/views/registration_view.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
        body: const RegistrationView());
  }
}
