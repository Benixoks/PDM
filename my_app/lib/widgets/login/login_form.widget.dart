import 'package:flutter/material.dart';
import 'package:my_app/widgets/auth_form_field.widget.dart';
import 'package:my_app/widgets/auth_button.widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool mostraSenha = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthFormField(
          nameController: _emailController,
          fieldName: 'email',
          keyboardType: TextInputType.emailAddress,
          inputDecoration: InputDecoration(
            icon: const Icon(Icons.mail),
            iconColor: Theme.of(context).colorScheme.primary,
          ),
        ),
        AuthFormField(
          nameController: _passwordController,
          fieldName: 'password',
          inputDecoration: InputDecoration(
            labelText: "Senha",
            icon: const Icon(Icons.key),
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
        ),
        AuthButton(
          username: _emailController.text,
          password: _passwordController.text,
        )
      ],
    );
  }
}
