// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/widgets/login/login_form.widget.dart';
import 'package:my_app/pages/register.page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool mostraSenha = false;
String _email = '';
String _senha = '';

final _formKey = GlobalKey<FormState>();
final _emailController = TextEditingController();
final _senhaController = TextEditingController();


class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Theme(
        data: ThemeData(
          textSelectionTheme:
              const TextSelectionThemeData(selectionColor: Colors.greenAccent),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Olá, Torcedor!\nSeja Bem Vindo ao ClubFLA!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: Text(
                            'Realize seu login na plaforma oficial do sócio torcedor!',
                            style: TextStyle(fontSize: 20)),
                      ),
                      LoginForm(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Não tem uma conta?'),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
                                ),
                              );
                            },
                            child: RichText(
                              text: TextSpan(
                                text: 'Cadastre-se!',
                                style: TextStyle(color: Colors.greenAccent),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
