class User {
  final String id;
  final String name;
  final String username;
  final String email;
  final String password;
  final String profilePicture;
  final bool isAdmin;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.profilePicture,
    required this.isAdmin,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      profilePicture: json['profilePicture'] as String,
      isAdmin: json['isAdmin'] as bool,
    );
  }
}
