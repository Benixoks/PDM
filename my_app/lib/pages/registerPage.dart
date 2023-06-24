import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/pages/login_page.dart';
import 'package:my_app/widgets/login/login_form.widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _nome = '';
  String _email = '';
  String _celular = '';
  String _dataNasc = '';
  String _cpf = '';
  String _senha = '';
  final String _confirmaSenha = '';
  bool mostraSenha = false;
  bool aceitaTermo = false;
  bool validate = false;
  // int get length;

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _celController = TextEditingController();
  final _dataNascController = TextEditingController();
  final _cpfController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmaSenhaController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _celController.dispose();
    _dataNascController.dispose();
    _cpfController.dispose();
    _senhaController.dispose();
    _confirmaSenhaController.dispose();
    super.dispose();
  }

  // Cria Usuário
  // Future signUp() async{
  //   if(passwordConfirmed()){
  //     await FirebaseAuth.instance.createUser;
  //     email: _emailController.text.trim();
  //     senha: _senhaController.text.trim();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(backgroundColor: Colors.blueGrey),
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Center(
              child: SingleChildScrollView(
                child: Theme(
                  data: ThemeData(
                    textSelectionTheme: const TextSelectionThemeData(
                        selectionColor: Colors.greenAccent),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),

                        //TextField NOME
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          controller: _nomeController,
                          autofocus: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp('[a-z A-Z]'),
                            ),
                            FilteringTextInputFormatter.deny(
                              RegExp('[0-9]'),
                            ),
                          ],
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white),                    
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.greenAccent)),
                            labelStyle: const TextStyle(color: Colors.white),
                            labelText: "Nome Completo",
                            
                            icon: const Icon(Icons.person),
                            iconColor: Colors.greenAccent,
                          ),
                          validator: (nome) {
                            if (nome == null || nome.isEmpty) {
                              return '* Este campo deve ser preenchido!';
                            } else if (nome.length < 3) {
                              return 'Seu nome deve conter mais de 2 caracteres!';
                            }
                            return null;
                          },
                          onSaved: (val) {
                            _nome = val!;
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(25.0),

                        //TextField EMAIL
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          controller: _emailController,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return '* Este campo deve ser preenchido!';
                            } else if (email.contains('@')) {
                              return null;
                            } else {
                              return 'E-mail inválido!';
                            }
                          },
                          autofocus: true,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.greenAccent)),
                            labelStyle: const TextStyle(color: Colors.white),
                            labelText: "E-mail",
                            hintText: 'exemplo123@gmail.com',
                            hintStyle: const TextStyle(color: Colors.white),
                            icon: const Icon(Icons.mail),
                            iconColor: Colors.greenAccent,
                          ),
                          onChanged: (text) {
                            if (text.contains('@') && text.contains('.')) {
                              print('Email válido!');
                            } else {
                              print('Email inválido!');
                            }
                            _email = text;
                          },
                        ),
                      ),

                      //TextField FONE
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          controller: _celController,
                          validator: (celular) {
                            if (celular == null || celular.isEmpty) {
                              return '* Este campo deve ser preenchido!';
                            }
                            return null;
                          },
                          autofocus: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp('[0-9]'),
                            ),
                            FilteringTextInputFormatter.deny(
                              RegExp('[a-zA-Z]'),
                            ),
                            MaskTextInputFormatter(
                              mask: '(###) # ####-####',
                              filter: {'#': RegExp('[0-9]')},
                            ),
                          ],
                          maxLength: 20,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            
                            prefixText: '+55 ',
                            prefixStyle: const TextStyle(color: Colors.greenAccent),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.greenAccent)),
                            labelStyle: const TextStyle(color: Colors.white),
                            labelText: "Celular",
                            hintText: '(DDD) 0 0000-0000',
                            hintStyle: const TextStyle(color: Colors.white),
                            icon: const Icon(Icons.phone),
                            iconColor: Colors.greenAccent,
                          ),
                          onChanged: (text) {
                            _celular = text;
                          },
                        ),
                      ),

                      //TextField DATA DE NASCIMENTO
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          controller: _dataNascController,
                          validator: (dataNasc) {
                            if (dataNasc == null || dataNasc.isEmpty) {
                              return '* Este campo deve ser preenchido!';
                            }
                            return null;
                          },
                          autofocus: true,
                          inputFormatters: [
                            MaskTextInputFormatter(
                              mask: '##/##/####',
                              filter: {'#': RegExp(r'[0-9]')},
                            ),
                          ],
                          maxLength: 10,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.greenAccent)),
                            labelStyle: const TextStyle(color: Colors.white),
                            labelText: "Data de Nascimento",
                            hintText: 'dd/mm/aaaa',
                            hintStyle: const TextStyle(color: Colors.white),
                            icon: const Icon(Icons.person),
                            iconColor: Colors.greenAccent,
                          ),
                          onChanged: (text) {
                            _dataNasc = text;
                          },
                        ),
                      ),

                      //TextField CPF
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          controller: _cpfController,
                          validator: (cpf) {
                            if (cpf == null || cpf.isEmpty) {
                              return '* Este campo deve ser preenchido!';
                            }
                            return null;
                          },
                          autofocus: true,
                          maxLength: 14,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            MaskTextInputFormatter(
                              mask: '###.###.###-##',
                              filter: {
                                '#': RegExp('[0-9]'),
                              },
                            ),
                          ],
                          decoration: InputDecoration(
                            icon: const Icon(Icons.person),
                            iconColor: Colors.greenAccent,
                            labelText: 'CPF',
                            hintText: '000.000.000-00',
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.greenAccent)),
                            labelStyle: const TextStyle(color: Colors.white),
                          ),
                          onChanged: (text) {
                            _cpf = text;
                          },
                        ),
                      ),

                      //TextField SENHA
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          controller: _senhaController,
                          validator: (senha) {
                            if (senha == null || senha.isEmpty) {
                              return '* Este campo é obrigatório!';
                            } else if (senha.length < 6) {
                              return '* Sua senha deve conter pelo menos 6 dígitos!';
                            }
                            return null;
                          },
                          autofocus: true,
                          obscureText: !mostraSenha,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.greenAccent)),
                            labelStyle: const TextStyle(color: Colors.white),
                            labelText: "Senha",
                            icon: const Icon(Icons.key),
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

                      //CheckBox MOSTRAR SENHA

                      //TextField CONFIRMA SENHA

                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          controller: _confirmaSenhaController,
                          validator: (confirmaSenha) {
                            if (confirmaSenha == null ||
                                confirmaSenha.isEmpty) {
                              return '* Este campo deve ser preenchido!';
                            }
                            return null;
                          },
                          autofocus: true,
                          obscureText: !mostraSenha,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.greenAccent)),
                            labelStyle: const TextStyle(color: Colors.white),
                            icon: const Icon(Icons.key),
                            iconColor: Colors.greenAccent,
                            labelText: "Confirme sua Senha",
                          ),
                          onChanged: (val) {
                            if (_senha == _confirmaSenhaController) {
                              validate = true;
                            }
                          },
                        ),
                      ),

                      //CheckBox ACEITA TERMOS E CONDIÇÕES
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    activeColor: Colors.greenAccent,
                                    value: aceitaTermo,
                                    onChanged: (checked) {
                                      print(checked);
                                      setState(() {
                                        aceitaTermo = !aceitaTermo;
                                      });
                                    },
                                  ),
                                  const Text(
                                    'Eu concordo com os termos e condições',
                                    style: TextStyle(fontSize: 15, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      //Botão volta ao Login
                    
                      

                      //Botão CADASTRE-SE
                      ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              
                              backgroundColor: Colors.greenAccent,
                            ),
                            onPressed: () {
                              print('Nome $_nome');
                              print('Email $_email');
                              print('Celular $_celular');
                              print('DataNasc $_dataNasc');
                              print('CPF $_cpf');
                              print('Senha $_senha');
                              if (_formKey.currentState!.validate()) {
                                const Text('Cadastro feito com sucesso!');
                                Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (context) =>  HomePage()));
                              } else {
                                Text(
                                    'Não preencheu campos obrigatórios para cadastro');
                              }
                            },
                            child: const Text(
                              'Cadastrar',
                              selectionColor: Colors.greenAccent,
                            ),
                          ),
                          Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            
                              Text("Já tem uma conta?"),
                              TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                              
                              child: 
                              RichText(
                                text: TextSpan(
                                  text: 'Faça Login!',
                                  style: TextStyle(color: Colors.greenAccent),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    
                  ),
                ),
              ),
            ),
          ),
        ));
  }

// class User{

//   final String _nome = '';
//   final String _celular = '';
//   final String _dataNasc = '';
//   final String _cpf = '';
//   String lista = [];

// }

// class Users extends User{
}
