import 'dart:convert';

import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/models/user.dart';

import 'package:get/get.dart';

class ApiService {
  final endPointUrl = "https://landina-account.iran.liara.run/";

  // Login User Future
  Future<void> loginUser(
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse('${endPointUrl}api/auth/login'),
      headers: {
        "Content-type": "application/json",
      },
      body: json.encode({'email': email, 'password': password}),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print("Correct");

      Config.box.write("email", email);
      Config.box.write("pass", password);

      print(Config.box.read("email"));
      print(Config.box.read("pass"));

      Get.offNamed("/profile");

      print(response.statusCode);
    } else {
      print("Wrong");
      Get.snackbar(response.statusCode.toString(), response.body);
      print(response.statusCode);
    }
  }

  Future<UserModel?> userInfo() async {
    final response = await http.get(
      Uri.parse('${endPointUrl}users/me'),
      headers: {
        "Content-type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      print("UserInfo Correct");

      loginUser(Config.box.read("email"), Config.box.read("pass"));

      print(Config.box.read("email"));
      print(Config.box.read("pass"));

      UserModel.fromJson(jsonDecode(response.body));
    }
  }
}
