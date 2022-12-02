import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
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
    } else {
      print("Wrong");
      print(response.statusCode);
    }
  }

  Future<Null> userInfo() async {
    final response = await http.get(
      Uri.parse('${endPointUrl}users/me'),
      headers: {
        "Content-type": "application/json",
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      print("Correct");

      SharedPreferences pref = await SharedPreferences.getInstance();
      final String? email = pref.getString("email");
      final String? password = pref.getString("password");

      print(response.statusCode);
    } else {
      print("Wrong");
      print(response.statusCode);
    }
  }
}
