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
  Future<void> login(String email, String password) async {}

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
  Future<void> signOut(String email) async {
    try {} catch (e) {}
  }

  @action
  Future<void> changePassword(String email) async {
    try {} catch (e) {}
  }
}
