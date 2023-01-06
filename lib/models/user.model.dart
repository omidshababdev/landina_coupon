class UserModel {
  String? id;
  String? name;
  String? username;
  String? image;
  String? email;
  String? password;
  String? bio;
  String? profilePicture;
  List? followers;
  List? followings;
  List? links;
  String? accountType;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.image,
    this.email,
    this.password,
    this.bio,
    this.profilePicture,
    this.followers,
    this.followings,
    this.links,
    this.accountType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'image': image,
      'email': email,
      'password': password,
      'bio': bio,
      'profilePicture': profilePicture,
      'followers': followers,
      'followings': followings,
      'links': links,
      'accountType': accountType,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'],
      name: map['name'] ?? 'نام و نام خانوادگی',
      username: map['username'] ?? 'username',
      image: map['image'] ?? "assets/images/landina-logo.png",
      email: map['email'] ?? 'ایمیل',
      password: map['password'] ?? 'رمز عبور',
      bio: map['bio'] ?? 'توضیحات صفحه اینجا نمایش داده میشن.',
      profilePicture: map['profilePicture'],
      followers: map['followers'] ?? 'دنبال کننده ها اینجا نمایش داده میشن',
      followings: map['followings'] ?? 'دنبال شونده ها اینجا نمایش داده میشن',
      links: map['links'] ?? 'لینک ها اینجا نمایش داده میشن',
      accountType: map['accountType'] ?? 'شخصی',
    );
  }
}
