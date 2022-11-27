class UserModel {
  String? status;
  User? user;

  UserModel({status, user});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        status: json['status'],
        user: json['user'] != null ? User.fromJson(json['user']) : null);
  }
}

class User {
  String? name;
  String? email;
  String? photo;
  String? role;
  String? createdAt;
  String? updatedAt;
  String? id;

  User({name, email, photo, role, createdAt, updatedAt, id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
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
