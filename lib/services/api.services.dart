import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:landina_coupon/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final endPointUrl = "https://703e-83-122-77-210.ngrok.io/";

  // Login User Future
  Future<void> loginUser(
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse('${endPointUrl}auth/login'),
      headers: {
        "Content-type": "application/json",
      },
      body: json.encode({'email': email, 'password': password}),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print("Correct");

      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("email", email);
      pref.setString("password", password);

      print(response.statusCode);
    } else {
      print("Wrong");
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
      print("Correct");
      return UserModel();
    }
  }
}
