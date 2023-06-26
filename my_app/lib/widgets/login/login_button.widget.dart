import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../pages/home.page.dart';

class LoginButton extends StatefulWidget {
  var username = "";
  var password = "";

  LoginButton({
    required this.username,
    required this.password,
    super.key,
  });

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  void login() async {
    // print("logando usuário");

    var url = Uri.parse(
        'https://localhost:7242/api/Auth/login'); // Replace with your own endpoint

    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
            {'username': widget.username, 'password': widget.password}));

    if (response.statusCode == 200) {
      var user = jsonDecode(response.body);
      // print(user['firstame']);
      // print(user['lastName']);
      // print(user['balance']);
      navigate(user['firstame'], user['lastName'], user['balance']);
    } else {
      print(response.body);
    }
  }

  void navigate(String firstName, String lastName, int balance) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  void onPressedLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.greenAccent,
        ),
        onPressed: onPressedLogin,
        child: const Text('Entrar'),
      ),
    );
  }
}
