import 'package:email_validator/email_validator.dart';

Map<String, String? Function(String? value)> validations = {
  'email': (String? input) {
    if (input == null || input.isEmpty) {
      return 'Email é obrigatório';
    }

    if (!EmailValidator.validate(input)) {
      return 'Email inválido';
    }

    return null;
  },
  'password': (String? input) {
    if (input == null || input.isEmpty) {
      return '* Este campo é obrigatório!';
    }

    if (input.length < 6) {
      return '* Sua senha deve conter pelo menos 6 dígitos!';
    }

    if (!input.contains(RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*(),.?":{}|<>])'))) {
      return "Sua senha deve conter letras maiúsculas, minúsculas, numeros e caracteres especiais";
    }

    return null;
  },
  'name': (String? input) {
    if (input == null || input.isEmpty) {
      return '* Este campo deve ser preenchido!';
    }

    if (input.length < 3) {
      return 'Seu input deve conter mais de 2 caracteres!';
    }

    return null;
  },
  'phone': (String? input) {
    if (input == null || input.isEmpty) {
      return '* Este campo deve ser preenchido!';
    }
    return null;
  },
  'birthDate': (String? input) {
    if (input == null || input.isEmpty) {
      return '* Este campo deve ser preenchido!';
    }
    return null;
  },
  'cpf': (String? input) {
    if (input == null || input.isEmpty) {
      return '* Este campo deve ser preenchido!';
    }
    return null;
  },
};
