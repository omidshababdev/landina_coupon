class UserModel {
  String? Id;
  String? username;
  String? email;
  String? password;
  String? profilePicture;
  String? coverPicture;
  bool? isAdmin;

  UserModel({
    Id,
    username,
    email,
    password,
    profilePicture,
    coverPicture,
    isAdmin,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      Id: json['_id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      profilePicture: json['profilePicture'],
      coverPicture: json['coverPicture'],
      isAdmin: json['isAdmin'],
    );
  }
}
