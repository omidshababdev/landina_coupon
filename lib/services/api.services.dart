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
  Future<User> loginUser(String email, String password) async {
    final res = await http.post(
      Uri.parse('${endPointUrl}api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (res.statusCode == 200) {
      Config.box.write("email", email);
      Config.box.write("pass", password);

      Config.box.write("userId", "6399fd67ba7ab3128989057e");

      Get.offNamed("/profile");
      return User.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to Login.');
    }
  }

  // Get a User
  Future<User> getUser(String userId) async {
    final res = await http.get(
      Uri.parse('${endPointUrl}api/users/${userId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (res.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return User.fromJson(jsonDecode(res.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to get user!');
    }
  }
}
