class User {
  String? name;
  String? email;
  String? photo;
  String? role;
  String? createdAt;
  String? updatedAt;
  String? id;

  User(
      {this.name,
      this.email,
      this.photo,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    photo = json['photo'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['photo'] = photo;
    data['role'] = role;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['id'] = id;
    return data;
  }
}
