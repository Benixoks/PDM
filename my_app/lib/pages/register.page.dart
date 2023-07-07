import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/common/validations.dart';
import 'package:my_app/pages/login.page.dart';
import 'package:my_app/widgets/auth_form_field.widget.dart';
import 'package:provider/provider.dart';
import '../stores/user.store.dart';

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

  void onPressedRegister() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      UserStore userStore = Provider.of<UserStore>(context, listen: false);

      await userStore.register(_nameController.text, _emailController.text,
          _phoneController.text, _cpfController.text, _passwordController.text);

      if (context.mounted) Navigator.pushReplacementNamed(context, '/home');
      const Text('Cadastro feito com sucesso!');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(backgroundColor: Colors.black),
            body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Center(
              child: SingleChildScrollView(
                child: Theme(
                  data: ThemeData(
                    textSelectionTheme: const TextSelectionThemeData(
                        selectionColor: Colors.white
                        ),
                    checkboxTheme: CheckboxThemeData(
                    checkColor: MaterialStateProperty.all(Colors.white),
                    fillColor: MaterialStateProperty.all(Colors.white),
                    overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.12)),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    side: const BorderSide(color: Colors.white),
                  ),),),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //TextField NOME
                      AuthFormField(
                        nameController: _nameController,
                        fieldName: 'nome',
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp('[a-z A-Z]'),
                          ),
                        ],
                        inputDecoration: InputDecoration(
                          labelStyle: const TextStyle(color: Colors.white),
                          icon: const Icon(Icons.person),
                          iconColor: const Color.fromARGB(255, 189, 1, 1),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:  const BorderSide(color: Color.fromARGB(255, 189, 1, 1)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                             borderSide:
                                  BorderSide(color: Colors.white),
                            ),
                        ),
                      ),

                      //TextField EMAIL
                      AuthFormField(
                        nameController: _emailController,
                        fieldName: 'email',
                        keyboardType: TextInputType.emailAddress,
                        inputDecoration: InputDecoration(
                          labelStyle: const TextStyle(color: Colors.white),
                          icon: const Icon(Icons.mail),
                          hintText: 'exemplo123@gmail.com',
                          iconColor: const Color.fromARGB(255, 189, 1, 1),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:  const BorderSide(color: Color.fromARGB(255, 189, 1, 1)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                             borderSide:
                                  BorderSide(color: Colors.white),
                            ),
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
                            mask: '(##) # ####-####',
                            filter: {'#': RegExp('[0-9]')},
                          ),
                        ],
                        inputDecoration: InputDecoration(
                          labelStyle: const TextStyle(color: Colors.white),
                          icon: const Icon(Icons.phone),
                          prefixText: '+55 ',
                          prefixStyle: const TextStyle(color: Colors.white),
                          hintText: '(DD) 0 0000-0000',
                          iconColor: const Color.fromARGB(255, 189, 1, 1),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:  const BorderSide(color: Color.fromARGB(255, 189, 1, 1)),
                        ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white),
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
                            iconColor: const Color.fromARGB(255, 189, 1, 1),
                            labelText: 'CPF',
                            labelStyle: const TextStyle(color: Colors.white),
                            hintText: '000.000.000-00',
                            hintStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:  const BorderSide(color: Color.fromARGB(255, 189, 1, 1)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                             borderSide:
                                  BorderSide(color: Colors.white),
                            ),
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
                              borderSide: const BorderSide(color: Color.fromARGB(255, 189, 1, 1)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            labelStyle: const TextStyle(color: Colors.white),
                            labelText: "Senha",
                            icon: const Icon(Icons.key),
                            iconColor: const Color.fromARGB(255, 189, 1, 1),
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
                              borderSide: const BorderSide(color: Color.fromARGB(255, 189, 1, 1)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white)),
                            labelStyle: const TextStyle(color: Colors.white),
                            icon: const Icon(Icons.key),
                            iconColor: const Color.fromARGB(255, 189, 1, 1),
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
                                activeColor:const Color.fromARGB(255, 189, 1, 1),
                                visualDensity: VisualDensity.compact,
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: const BorderSide(color: Colors.white),
                                ),
                                checkColor: Colors.white,
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
                          backgroundColor: const Color.fromARGB(255, 189, 1, 1),
                        ),
                        onPressed: onPressedRegister,
                        child: const Text(
                          'Cadastrar',
                          selectionColor: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text('Já tem uma conta?',style: TextStyle(color: Colors.white),),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: RichText(
                              text: const TextSpan(
                                text: 'Faça Login!',
                                style: TextStyle(color: Color.fromARGB(255, 189, 1, 1),),
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
        ));
  }
}
