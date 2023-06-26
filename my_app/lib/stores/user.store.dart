import 'package:mobx/mobx.dart';

part 'user.store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  @observable
  int id = -1;

  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String phone = '';

  @observable
  String cpf = '';

  @observable
  String password = '';

  @observable
  DateTime birthDate = DateTime(0000, 00, 00);

  @observable
  String token = '';

  @computed
  bool get isAuthenticated => token.isNotEmpty;

  @action
  Future<void> login(String email, String password) async {
    try {} catch (e) {}
  }

  @action
  Future<void> register(String name, String email, String phone, String cpf,
      String password, DateTime birthDate) async {
    try {} catch (e) {}
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
