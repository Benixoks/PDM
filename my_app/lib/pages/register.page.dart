import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/common/validations.dart';
import 'package:my_app/widgets/auth_form_field.widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _cpfController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool aceitaTermo = false;
  bool mostraSenha = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _birthDateController.dispose();
    _cpfController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? confirmPasswordValidation(String? input) {
    if (input != _passwordController.text) {
      return "Senhas estão diferentes";
    }
    return null;
  }

  void onPressedRegister() {
    if (_formKey.currentState!.validate()) {
      const Text('Cadastro feito com sucesso!');
      Navigator.pop(context);
    } else {
      print('Não preencheu campos obrigatórios para cadastro');
    }
  }

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
                      //TextField NOME
                      AuthFormField(
                        nameController: _nameController,
                        fieldName: 'name',
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp('[a-z A-Z]'),
                          ),
                        ],
                        inputDecoration: InputDecoration(
                          icon: const Icon(Icons.person),
                          iconColor: Theme.of(context).colorScheme.primary,
                        ),
                      ),

                      AuthFormField(
                        nameController: _emailController,
                        fieldName: 'email',
                        keyboardType: TextInputType.emailAddress,
                        inputDecoration: InputDecoration(
                          icon: const Icon(Icons.mail),
                          hintText: 'exemplo123@gmail.com',
                          iconColor: Theme.of(context).colorScheme.primary,
                        ),
                      ),

                      //TextField PHONE
                      AuthFormField(
                        nameController: _phoneController,
                        fieldName: 'phone',
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp('[0-9]'),
                          ),
                          MaskTextInputFormatter(
                            mask: '(###) # ####-####',
                            filter: {'#': RegExp('[0-9]')},
                          ),
                        ],
                        inputDecoration: InputDecoration(
                          icon: const Icon(Icons.phone),
                          prefixText: '+55 ',
                          prefixStyle: const TextStyle(color: Colors.white),
                          hintText: '(DDD) 0 0000-0000',
                          iconColor: Theme.of(context).colorScheme.primary,
                        ),
                      ),

                      AuthFormField(
                        nameController: _birthDateController,
                        fieldName: 'birthDate',
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp('[0-9]'),
                          ),
                          MaskTextInputFormatter(
                            mask: '(###) # ####-####',
                            filter: {'#': RegExp('[0-9]')},
                          ),
                        ],
                        inputDecoration: InputDecoration(
                          icon: const Icon(Icons.person),
                          hintText: 'dd/mm/aaaa',
                          iconColor: Theme.of(context).colorScheme.primary,
                        ),
                      ),

                      //TextField DATA DE NASCIMENTO
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          controller: _birthDateController,
                          validator: validations['birthDate'],
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
                        ),
                      ),

                      //TextField CPF
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          controller: _cpfController,
                          validator: validations['cpf'],
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
                        ),
                      ),

                      //TextField SENHA
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          controller: _passwordController,
                          validator: validations['password'],
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
                        ),
                      ),

                      //CheckBox MOSTRAR SENHA

                      //TextField CONFIRMA SENHA
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          controller: _confirmPasswordController,
                          validator: confirmPasswordValidation,
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
                        ),
                      ),

                      //CheckBox ACEITA TERMOS E CONDIÇÕES
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
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //Botão CADASTRE-SE
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent,
                        ),
                        onPressed: onPressedRegister,
                        child: const Text(
                          'Cadastrar',
                          selectionColor: Colors.greenAccent,
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
}
