import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:landina_coupon/ui/pages/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/pages/profile/profile.dart';

class ApiService {
  final endPointUrl = "http://localhost:8000/";

  // Login User Future
  Future<void> loginUser(
    TextEditingController email,
    TextEditingController password,
  ) async {
    final response = await http.post(
      Uri.parse('${endPointUrl}auth/login'),
      headers: {
        "Content-type": "application/json",
      },
      body: json.encode({'email': email.text, 'password': password.text}),
    );
    print(response.body);
    if (response.statusCode == 200) {
      print("Correct");

      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("email", email.text);
      pref.setString("password", password.text);

      print(response.statusCode);

      Get.off(() => const ProfilePage());
    } else {
      print("Wrong");
      print(response.statusCode);
    }
  }
}
