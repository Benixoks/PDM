String? emailValidation(email) {
  if (email == null || email.isEmpty) {
    return '* Este campo deve ser preenchido!';
  }
  return null;
}

String? passwordValidation(password) {
  if (password == null || password.isEmpty) {
    return '* Este campo deve ser preenchido!';
  }
  return null;
}
