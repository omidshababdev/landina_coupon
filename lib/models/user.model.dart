class UserModel {
  String? id;
  String? name;
  String? username;
  String? email;
  String? password;
  String? bio;
  String? profilePicture;
  // Array? followers;
  // Array? followings;
  String? accountType;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.password,
    this.bio,
    this.profilePicture,
    // this.followers,
    // this.followings,
    this.accountType,
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
      // 'followers': followers,
      // 'followings': followings,
      'accountType': accountType,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'],
      name: map['name'] ?? 'نام و نام خانوادگی',
      username: map['username'] ?? 'username',
      email: map['email'] ?? 'ایمیل',
      password: map['password'] ?? 'رمز عبور',
      bio: map['bio'] ?? 'توضیحات صفحه اینجا نمایش داده میشن.',
      profilePicture: map['profilePicture'],
      // followers: map['followers'],
      // followings: map['followings'],
      accountType: map['accountType'] ?? 'شخصی',
    );
  }
}
