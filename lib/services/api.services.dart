import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:landina_coupon/models/login.dart';
import 'package:landina_coupon/ui/components/modals/login.modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/pages/profile/profile.dart';

class ApiService {
  final endPointUrl = "http://localhost:8000/";

  // Login User Future
  Future<void> loginUser() async {
    TextEditingController emailUsernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    if (passwordController.text.isNotEmpty &&
        emailUsernameController.text.isNotEmpty) {
      final response = await http.post(
        Uri.parse('${endPointUrl}auth/login'),
        headers: {
          "Content-type": "application/json",
        },
        body: json.encode({
          'email': emailUsernameController.text,
          'password': passwordController.text
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        print("Correct");

        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString("email", emailUsernameController.text);
        pref.setString("password", passwordController.text);

        Get.to(const ProfilePage());
      } else {
        print("Wrong");
        print(response.statusCode);
      }
    } else {
      //
    }
  }
}
