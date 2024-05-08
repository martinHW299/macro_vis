import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:macro_vision_1/presentations/screens/login_screen.dart';
import 'package:macro_vision_1/presentations/screens/main_screen.dart';
import 'package:macro_vision_1/services/user_service.dart';
import 'package:macro_vision_1/utils/text_controllers.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final UserService _userService = UserService();

  String _name = '';
  String _lastname = '';
  int _age = 0;
  String _email = '';
  String _password = '';

  void _showErrorPopupUserExists() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Esta cuenta ya existe'),
          content:
              const Text('Regresa a Inicio de Sesión o ingresa otros datos'),
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

  void _navigateToLoginScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  void _register() async {
    if (await _userService.existUserByEmail(_email)) {
      _showErrorPopupUserExists();
    } else {
      final bool success = await _userService.register(
          _name, _lastname, _age, _email, _password);
      if (success) {
        _navigateToLoginScreen();
      }
    }
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
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    labelText: 'Nombre',
                    labelStyle: TextStyle(
                        color: Color(0XFFBEBCBC), fontWeight: FontWeight.w700)),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: size.width * 0.8,
              child: TextField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    labelText: 'Apellido',
                    labelStyle: TextStyle(
                        color: Color(0XFFBEBCBC), fontWeight: FontWeight.w700)),
                onChanged: (value) {
                  setState(() {
                    _lastname = value;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: size.width * 0.8,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Edad',
                    labelStyle: TextStyle(
                        color: Color(0XFFBEBCBC), fontWeight: FontWeight.w700)),
                onChanged: (value) {
                  setState(() {
                    _age = int.tryParse(value) ?? 0;
                  });
                },
              ),
            ),
          ),
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
                decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(
                        color: Color(0XFFBEBCBC), fontWeight: FontWeight.w700)),
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
                  onPressed: () {
                    _register();
                  },
                  child: const Text('Registrar')))
        ],
      ),
    ));
  }
}
