import 'package:flutter/material.dart';
import '../pages/home.page.dart';

class AuthButton extends StatefulWidget {
  final String username;
  final String password;

  const AuthButton({
    required this.username,
    required this.password,
    super.key,
  });

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  void login() async {
    // var url = Uri.parse(
    //     'https://localhost:7242/api/Auth/login'); // Replace with your own endpoint

    // if (response.statusCode == 200) {
    //   var user = jsonDecode(response.body);
    //   navigate(user['firstame'], user['lastName'], user['balance']);
    // } else {
    //   print(response.body);
    // }
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
