import 'package:landina_coupon/models/user.model.dart';

class LoginModel {
  String? token;
  UserModel? user;

  LoginModel({
    this.token,
    this.user,
  });

  Map toMap() {
    return {
      'token': token,
      'user': user!.toMap(),
    };
  }

  factory LoginModel.fromJson(Map json) {
    return LoginModel(
      token: json['token'],
      user: UserModel.fromJson(json['user']),
    );
  }
}
