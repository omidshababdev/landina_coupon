class LoginModel {
  final String status;
  final String accessToken;

  LoginModel({required this.status, required this.accessToken});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'],
      accessToken: json['accessToken'],
    );
  }
}
