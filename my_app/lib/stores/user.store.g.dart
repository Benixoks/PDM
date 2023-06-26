// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on UserStoreBase, Store {
  Computed<bool>? _$isAuthenticatedComputed;

  @override
  bool get isAuthenticated =>
      (_$isAuthenticatedComputed ??= Computed<bool>(() => super.isAuthenticated,
              name: 'UserStoreBase.isAuthenticated'))
          .value;

  late final _$idAtom = Atom(name: 'UserStoreBase.id', context: context);

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$nameAtom = Atom(name: 'UserStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom = Atom(name: 'UserStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$phoneAtom = Atom(name: 'UserStoreBase.phone', context: context);

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$cpfAtom = Atom(name: 'UserStoreBase.cpf', context: context);

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'UserStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$birthDateAtom =
      Atom(name: 'UserStoreBase.birthDate', context: context);

  @override
  DateTime get birthDate {
    _$birthDateAtom.reportRead();
    return super.birthDate;
  }

  @override
  set birthDate(DateTime value) {
    _$birthDateAtom.reportWrite(value, super.birthDate, () {
      super.birthDate = value;
    });
  }

  late final _$tokenAtom = Atom(name: 'UserStoreBase.token', context: context);

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('UserStoreBase.login', context: context);

  @override
  Future<void> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  late final _$registerAsyncAction =
      AsyncAction('UserStoreBase.register', context: context);

  @override
  Future<void> register(String name, String email, String phone, String cpf,
      String password, DateTime birthDate) {
    return _$registerAsyncAction.run(
        () => super.register(name, email, phone, cpf, password, birthDate));
  }

  late final _$signOutAsyncAction =
      AsyncAction('UserStoreBase.signOut', context: context);

  @override
  Future<void> signOut(String email) {
    return _$signOutAsyncAction.run(() => super.signOut(email));
  }

  late final _$changePasswordAsyncAction =
      AsyncAction('UserStoreBase.changePassword', context: context);

  @override
  Future<void> changePassword(String email) {
    return _$changePasswordAsyncAction.run(() => super.changePassword(email));
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
email: ${email},
phone: ${phone},
cpf: ${cpf},
password: ${password},
birthDate: ${birthDate},
token: ${token},
isAuthenticated: ${isAuthenticated}
    ''';
  }
}
