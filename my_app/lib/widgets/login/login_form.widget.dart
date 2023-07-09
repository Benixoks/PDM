import 'package:flutter/material.dart';
import 'package:my_app/widgets/auth_form_field.widget.dart';
import 'package:provider/provider.dart';

import '../../common/validations.dart';
import '../../stores/user.store.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool mostraSenha = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void onPressedLogin() async {
    UserStore userStore = Provider.of<UserStore>(context, listen: false);

    await userStore.logIn(_emailController.text, _passwordController.text);

    if (context.mounted) Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthFormField(
          nameController: _emailController,
          fieldName: 'email',
          keyboardType: TextInputType.emailAddress,
          inputDecoration: InputDecoration(
            labelStyle: const TextStyle(color: Colors.white),
            icon: const Icon(Icons.mail),
            iconColor: Color.fromARGB(255, 189, 1, 1),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color.fromARGB(255, 189, 1, 1)),
              ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          ),
        ),

        AuthFormField(
          nameController: _passwordController,
          fieldName: 'password',
          inputDecoration: InputDecoration(
            labelStyle: const TextStyle(color: Colors.white),
            labelText: "Senha",
            icon: const Icon(Icons.key),
            iconColor: Color.fromARGB(255, 189, 1, 1),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color.fromARGB(255, 189, 1, 1)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
            suffixIcon: IconButton(
              icon: Icon(
                mostraSenha ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,

              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 189, 1, 1),
            ),
            onPressed: onPressedLogin,
            child: const Text(
              'Entrar',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
