import 'dart:convert';

class User {
  final String id;
  final String name;
  final String username;
  final String email;
  final String password;
  final String profilePicture;
  final String accountType;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.profilePicture,
    required this.accountType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'password': password,
      'profilePicture': profilePicture,
      'accountType': accountType,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? ' ',
      name: map['name'] ?? ' ',
      username: map['username'] ?? ' ',
      email: map['email'] ?? ' ',
      password: map['password'] ?? ' ',
      profilePicture: map['profilePicture'] ?? ' ',
      accountType: map['accountType'] ?? ' ',
    );
  }

  String toJson() => json.encode(toMap());
}
