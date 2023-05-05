// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/pages/registerPage.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

Future signIn() async {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _senhaController.text.trim());
}

class _LoginPageState extends State<LoginPage> {
  @override


  void dispose(){
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

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
                      // Bem Vindo!

                      Text(
                        'Olá, Torcedor!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text( 
                        'Seja Bem Vindo ao ClubFLA!',
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

                      //TextField EMAIL
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 10),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          controller: _emailController,
                          validator: (_email) {
                            if (_email == null || _email.isEmpty) {
                              return '* Este campo deve ser preenchido!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.greenAccent)),
                            labelStyle: const TextStyle(color: Colors.white),
                            labelText: 'E-mail',
                            hintText: 'exemplo123@gmail.com',
                            hintStyle: const TextStyle(color: Colors.white),
                            icon: Icon(Icons.mail),
                            iconColor: Colors.greenAccent,
                          ),
                        ),
                      ),

                      //TextField SENHA
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          autofocus: true,
                          controller: _senhaController,
                          validator: (_senha) {
                            if (_senha == null || _senha.isEmpty) {
                              return '* Este campo deve ser preenchido!';
                            }
                            return null;
                          },
                          obscureText: !mostraSenha,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.greenAccent)),
                            labelStyle: const TextStyle(color: Colors.white),
                            labelText: "Senha",
                            icon: Icon(Icons.key),
                            iconColor: Colors.greenAccent,
                            suffixIcon: IconButton(
                              icon: Icon(
                                mostraSenha
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  mostraSenha = !mostraSenha;
                                });
                              },
                            ),
                          ),
                          onChanged: (val) {
                            if (val.contains(RegExp('[A-Z]')) &&
                                val.contains(RegExp('[0-9]'))) {
                              _senha = val;
                            }
                          },
                        ),
                      ),

                      //Botão de LOGIN
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                          ),
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            //   logar();
                               Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                 ),
                               );
                            // }
                          },
                          child: Text('Entrar'),
                        ),
                      ),

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
