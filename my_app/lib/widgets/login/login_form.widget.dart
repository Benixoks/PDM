import 'package:flutter/material.dart';
import 'package:my_app/widgets/login/login_button.widget.dart';
import 'package:my_app/common/validations.dart';

import '../../pages/home.page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool mostraSenha = false;
  final String _email = '';
  String _senha = '';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void passwordOnChange(val) {
    if (val.contains(RegExp('[A-Z]')) && val.contains(RegExp('[0-9]'))) {
      _senha = val;
    }
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
    return Column(
      children: [
        //TextFormeField EMAIL
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
          child: SizedBox(
            width: 300,
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              controller: _emailController,
              validator: validations['email'],
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent)),
                labelStyle: const TextStyle(color: Colors.white),
                labelText: 'E-mail',
                hintText: 'exemplo123@gmail.com',
                hintStyle: const TextStyle(color: Colors.white),
                icon: const Icon(Icons.mail),
                iconColor: Colors.greenAccent,
              ),
            ),
          ),
        ),

        //TextFormeField PASSWORD
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SizedBox(
              width: 300,
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                autofocus: true,
                controller: _passwordController,
                validator: validations['password'],
                obscureText: !mostraSenha,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent)),
                  labelStyle: const TextStyle(color: Colors.white),
                  labelText: "Senha",
                  icon: const Icon(Icons.key),
                  iconColor: Colors.greenAccent,
                  suffixIcon: IconButton(
                    icon: Icon(
                      mostraSenha ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        mostraSenha = !mostraSenha;
                      });
                    },
                  ),
                ),
                onChanged: passwordOnChange,
              ),
            )),

        LoginButton(
          username: _emailController.text,
          password: _passwordController.text,
        )
      ],
    );
  }
}
