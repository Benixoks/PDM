import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/user.model.dart';

class UserService {
  Future<User> register(String firstName, String lastName, String email,
      String phone, String cpf, String password) async {
    var url = Uri.parse('https://localhost:52741/api/user/register');

    Response? response;

    var headers = {'Content-Type': 'application/json', 'accept': 'text/plain'};
    var body = json.encode({
      'firstName': firstName,
      'lastName': lastName,
      'cpf': cpf,
      'email': email,
      'phone': phone,
      'password': password
    });

    try {
      response = await http.post(url, headers: headers, body: body);
      print(response.statusCode);
      print(response.body);
    } catch (e) {
      rethrow;
    }

    return User.fromJson(response.body);
  }

  Future<User> logIn(String email, String password) async {
    var url = Uri.parse('https://localhost:52741/api/user/login');
    var headers = {'Content-Type': 'application/json', 'accept': 'text/plain'};
    Response? response;

    try {
      response = await http.post(url,
          headers: headers,
          body: json.encode({'email': email, 'password': password}));
    } catch (e) {
      rethrow;
    }

    return User.fromJson(response.body);
  }
}
