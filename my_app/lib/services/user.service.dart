import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../models/user.model.dart';

class UserService {
  String baseUrl = 'https://localhost:52741/api/user';
  Map<String, String> baseHeaders = {
    'Content-Type': 'application/json',
    'accept': 'text/plain'
  };

  Future<User> register(String firstName, String lastName, String email,
      String phone, String cpf, String password) async {
    var url = Uri.parse('$baseUrl/register');

    Response? response;
    var body = json.encode({
      'firstName': firstName,
      'lastName': lastName,
      'cpf': cpf,
      'email': email,
      'phone': phone,
      'password': password
    });

    try {
      response = await http.post(url, headers: baseHeaders, body: body);
      print(response.statusCode);
      print(response.body);
    } catch (e) {
      rethrow;
    }

    return User.fromJson(response.body);
  }

  Future<User> logIn(String email, String password) async {
    var url = Uri.parse('$baseUrl/login');
    var headers = {'Content-Type': 'application/json', 'accept': 'text/plain'};
    Response? response;

    try {
      response = await http.post(url,
          headers: headers,
          body: json.encode({'email': email, 'password': password}));
      print(response.statusCode);
      print(response.body);
    } catch (e) {
      rethrow;
    }

    return User.fromJson(response.body);
  }

  Future<Response> logOut(int id) async {
    var url = Uri.parse('$baseUrl/login');

    var body = json.encode({'userId': id});

    Response? response;
    try {
      response = await http.post(
        url,
        headers: baseHeaders,
        body: body,
      );
    } catch (e) {
      rethrow;
    }

    return response;
  }
}
