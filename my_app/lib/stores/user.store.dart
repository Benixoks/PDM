import 'dart:js_interop';

import 'package:mobx/mobx.dart';
import 'package:my_app/common/extensions.dart';
import 'package:my_app/models/user.model.dart';
import 'package:my_app/services/user.service.dart';

part 'user.store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  final UserService _service = UserService();

  @observable
  User user = User(0, "", "", "", "");

  @action
  Future<void> logIn(String email, String password) async {
    try {
      var response = await _service.logIn(email, password);
      user = response;
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> register(String name, String email, String phone, String cpf,
      String password) async {
    var names = name.getFirstAndLastName();

    try {
      var response = await _service.register(names[0], names[1], email,
          phone.toDigitsOnly(), cpf.toDigitsOnly(), password);

      user = response;
    } catch (e) {
      rethrow;
    }
  }

  @action
  Future<void> logOut(int userId) async {
    try {
      var response = await _service.logOut(userId);

      if (response.isNull) {
        throw Exception("Ocorreu um erro ao deslogar o usuário");
      }
      if (response.statusCode == 200) {
        user = User(0, "", "", "", "");
      }
    } catch (e) {
      rethrow;
    }
  }
}
