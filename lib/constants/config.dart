import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:landina_coupon/services/api.services.dart';
import 'package:landina_coupon/services/upload.services.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Config {
  Config._();
  static bool loggedIn = false;
  static bool inProfile = false;

  static bool lightMode = false;
  static bool darkMode = false;
  static bool defaultMode = false;

  static Locale myLocale = window.locale;
  static List rightAlignLangs = ['fa'];

  static TextEditingController usernameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  // static String baseUrl = "http://localhost:8800/";
  static String baseUrl = "https://landina-account.iran.liara.run/";
  // static String baseUrl = "https://landina-account.onrender.com/";

  static ApiServices client = ApiServices();
  static UploadServices upload = UploadServices();

  static GetStorage box = GetStorage();

  static themeStatus(value) {
    Config.box.write("themeStatus", value);
  }

  static getThemeStatus() {
    if (Config.box.read("themeStatus") == "defaultMode") {
      Config.defaultMode = true;
      Config.lightMode = false;
      Config.darkMode = false;
      return ThemeMode.light;
    } else if (Config.box.read("themeStatus") == "lightMode") {
      Config.defaultMode = false;
      Config.lightMode = true;
      Config.darkMode = false;
      return ThemeMode.light;
    } else if (Config.box.read("themeStatus") == "darkMode") {
      Config.defaultMode = false;
      Config.lightMode = false;
      Config.darkMode = true;
      return ThemeMode.dark;
    } else {
      Config.defaultMode = true;
      Config.lightMode = false;
      Config.darkMode = false;
      return ThemeMode.system;
    }
  }

  static PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  static validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'لطفا یک آدرس ایمیل معتبر وارد کن';
    } else {
      return null;
    }
  }
}
