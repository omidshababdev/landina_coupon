import 'dart:convert';

class UserModel {
  final String id;
  final String name;
  final String username;
  final String email;
  final String password;
  final String bio;
  final String profilePicture;
  final String accountType;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.bio,
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
      'bio': bio,
      'profilePicture': profilePicture,
      'accountType': accountType,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'] ?? ' ',
      name: map['name'] ?? ' ',
      username: map['username'] ?? ' ',
      email: map['email'] ?? ' ',
      password: map['password'] ?? ' ',
      bio: map['bio'] ?? ' ',
      profilePicture: map['profilePicture'] ?? ' ',
      accountType: map['accountType'] ?? ' ',
    );
  }

  String toJson() => json.encode(toMap());
}
