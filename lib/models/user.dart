class UserModel {
  final String id;
  final String username;
  final String email;
  final String password;
  final String profilePicture;
  final String coverPicture;
  final bool isAdmin;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.profilePicture,
    required this.coverPicture,
    required this.isAdmin,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      profilePicture: json['profilePicture'] as String,
      coverPicture: json['coverPicture'] as String,
      isAdmin: json['isAdmin'] as bool,
    );
  }
}
