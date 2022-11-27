class LoginModel {
  String? status;
  String? accessToken;

  LoginModel({this.status, this.accessToken});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'],
      accessToken: json['accessToken'],
    );
  }
}
