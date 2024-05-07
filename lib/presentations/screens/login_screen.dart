import 'package:flutter/material.dart';
import 'package:macro_vision_1/presentations/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: size.width * 0.8,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: 'Correo',
                    labelStyle: TextStyle(
                        color: Color(0XFFBEBCBC), fontWeight: FontWeight.w700)),
                onChanged: (value) {},
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.1,
                right: size.width * 0.1,
                bottom: size.height * 0.05),
            child: SizedBox(
              width: size.width * 0.8,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(
                        color: Color(0XFFBEBCBC), fontWeight: FontWeight.w700)),
                onChanged: (value) {},
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainScreen()));
              },
              child: const Text('Iniciar Sesión'))
        ],
      ),
    ));
  }
}
