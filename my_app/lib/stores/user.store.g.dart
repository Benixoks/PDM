// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on UserStoreBase, Store {
  late final _$userAtom = Atom(name: 'UserStoreBase.user', context: context);

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$logInAsyncAction =
      AsyncAction('UserStoreBase.logIn', context: context);

  @override
  Future<void> logIn(String email, String password) {
    return _$logInAsyncAction.run(() => super.logIn(email, password));
  }

  late final _$registerAsyncAction =
      AsyncAction('UserStoreBase.register', context: context);

  @override
  Future<void> register(
      String name, String email, String phone, String cpf, String password) {
    return _$registerAsyncAction
        .run(() => super.register(name, email, phone, cpf, password));
  }

  late final _$logOutAsyncAction =
      AsyncAction('UserStoreBase.logOut', context: context);

  @override
  Future<void> logOut(int userId) {
    return _$logOutAsyncAction.run(() => super.logOut(userId));
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
