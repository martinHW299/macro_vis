import 'dart:convert';
import 'dart:developer';
import 'package:macro_vision_1/utils/timezone.dart';

import 'package:http/http.dart' as http;

class UserService {
  static const String host = 'http://172.16.76.109:8080';

  Future<bool> existUserByEmailAndPassword(
      String email, String password) async {
    try {
      final response = await http.get(
        Uri.parse('$host/userEmailPassword?email=$email&password=$password'),
      );
      if (response.statusCode == 200) {
        final userData = json.decode(response.body);
        bool userExists = userData != null;
        return userExists;
      } else {
        // Login failed
        log('Login failed: ${response.body}');
        return false;
      }
    } catch (error) {
      log('Login failed: $error');
      return false;
    }
  }

  Future<bool> register(String name, String lastname, int age, String email,
      String password) async {
    try {
      final response = await http.post(
        Uri.parse('$host/addUser'),
        body: jsonEncode({
          'name': name,
          'lastname': lastname,
          'age': age,
          'email': email,
          'password': password,
          'created_at': getBoliviaDateTime().toIso8601String()
        }),
        headers: {'Content-Type': 'application/json'},
      );
      log('Response: ${response.body}');
      if (response.statusCode == 200) {
        return true;
      } else {
        log('Add user failed: ${response.body}');
        return false;
      }
    } catch (error) {
      log('Error adding user: $error');
      return false;
    }
  }

  Future<bool> existUserByEmail(String email) async {
    try {
      final response = await http.get(
        Uri.parse('$host/userEmail?email=$email'),
      );
      if (response.statusCode == 200) {
        bool userExists = json.decode(response.body);
        return userExists;
      } else {
        // Login failed
        log('Login failed: ${response.body}');
        return false;
      }
    } catch (error) {
      log('Login failed: $error');
      return false;
    }
  }
}
