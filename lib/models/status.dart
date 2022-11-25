import 'package:landina_coupon/models/user.dart';

class Status {
  String? status;
  User? user;

  Status({this.status, this.user});

  Status.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
