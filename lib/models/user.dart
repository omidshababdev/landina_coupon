class UserModel {
  final String name;
  final String email;
  final String photo;
  final String role;
  final String createdAt;
  final String updatedAt;
  final String id;

  UserModel({
    required this.name,
    required this.email,
    required this.photo,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      photo: json['photo'],
      role: json['role'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      id: json['id'],
    );
  }
}
