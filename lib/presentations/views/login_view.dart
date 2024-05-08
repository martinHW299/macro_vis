import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:macro_vision_1/presentations/screens/main_screen.dart';
import 'package:macro_vision_1/presentations/screens/registration_screen.dart';
import 'package:macro_vision_1/services/user_service.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final UserService _userService = UserService();
  String _email = '';
  String _password = '';

  void _showErrorPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Esta cuenta no existe'),
          content: const Text('Correo o contraseña inválidos'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToMainScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MainScreen()));
  }

  void _navigateToRegistrationScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RegistrationScreen()));
  }

  void _login() async {
    final bool success =
        await _userService.existUserByEmailAndPassword(_email, _password);
    if (success) {
      _navigateToMainScreen();
    } else {
      _showErrorPopup();
    }
  }

  //Para ocultar password
  bool _obscured = false;
  final textFieldFocusNode = FocusNode();

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = false;
    });
  }

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
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
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
                keyboardType: TextInputType.visiblePassword,
                obscureText: _obscured,
                focusNode: textFieldFocusNode,
                decoration: InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: const TextStyle(
                        color: Color(0XFFBEBCBC), fontWeight: FontWeight.w700),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: GestureDetector(
                        onTap: _toggleObscured,
                        child: Icon(
                          _obscured
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_off_rounded,
                          size: 24,
                        ),
                      ),
                    )),
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
            ),
          ),
          SizedBox(
              width: size.width * 0.8,
              child: ElevatedButton(
                  onPressed: _login, child: const Text('Iniciar Sesión'))),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: GestureDetector(
                  onTap: _navigateToRegistrationScreen,
                  child: RichText(
                    text: const TextSpan(
                        text: '¿No tiene cuenta? ',
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Registrarse',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue))
                        ]),
                  )),
            ),
          )
        ],
      ),
    ));
  }
}
