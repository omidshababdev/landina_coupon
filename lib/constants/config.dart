import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:landina_coupon/services/api.services.dart';

class Config {
  Config._();
  static bool loggedIn = false;
  static bool inProfile = false;

  static TextEditingController usernameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  static ApiService client = ApiService();

  static GetStorage box = GetStorage();
}
