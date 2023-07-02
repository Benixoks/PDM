import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/home.page.dart';
import '../stores/user.store.dart';

class AuthButton extends StatefulWidget {
  final String email;
  final String password;

  const AuthButton({
    required this.email,
    required this.password,
    super.key,
  });

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  void navigate(String firstName, String lastName, int balance) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  void onPressedLogin() async {
    UserStore userStore = Provider.of<UserStore>(context, listen: false);

    print(widget.email);
    print(widget.password);

    // await userStore.logIn(widget.email, widget.password);

    // if (context.mounted) Navigator.pushReplacementNamed(context, '/home');

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const HomePage(),
    //   ),
    // );
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
