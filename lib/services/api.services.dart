import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/models/user.dart';

import 'package:get/get.dart';

class ApiService {
  final endPointUrl = "https://landina-account.iran.liara.run/";

  // SignUp User
  Future<void> signUpUser({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
        id: ' ',
        name: ' ',
        username: username,
        email: email,
        password: password,
        profilePicture: ' ',
        accountType: 'Personal',
      );

      http.Response res = await http.post(
        Uri.parse('${endPointUrl}api/auth/register'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.statusCode);
    } catch (e) {
      //
    }
  }

  // Login User Future
  Future<void> loginUser(
    String email,
    String password,
  ) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${endPointUrl}api/auth/login'),
        headers: {
          "Content-type": "application/json",
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (res.statusCode == 200) {
        Config.box.write("email", email);
        Config.box.write("pass", password);

        Get.offNamed("/profile");
        print(res.body);
      } else {
        Get.snackbar(res.statusCode.toString(), res.body);
      }
    } catch (e) {
      Get.snackbar("An Error", e.toString());
    }
  }

  Future<User?> userInfo() async {
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

      User.fromJson(jsonDecode(response.body));
    }
  }
}
