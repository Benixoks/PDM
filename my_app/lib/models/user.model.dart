// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String cpf;
  final String username;
  final String email;
  final String phone;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.cpf,
    required this.username,
    required this.email,
    required this.phone,
  });

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? cpf,
    String? username,
    String? email,
    String? phone,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      cpf: cpf ?? this.cpf,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'cpf': cpf,
      'username': username,
      'email': email,
      'phone': phone,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      cpf: map['cpf'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, cpf: $cpf, username: $username, email: $email, phone: $phone)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.cpf == cpf &&
        other.username == username &&
        other.email == email &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        cpf.hashCode ^
        username.hashCode ^
        email.hashCode ^
        phone.hashCode;
  }
}
