import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/models/coupon.dart';
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
      UserModel user = UserModel(
        id: ' ',
        name: 'نام و نام خانوادگی',
        username: username,
        email: email,
        password: password,
        bio: 'اطلاعاتی که می تونه به افراد بازدیدکننده از پرفایلت کمک کنه',
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
    } catch (e) {
      //
    }
  }

  // Login User
  Future<UserModel> loginUser(String email, String password) async {
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

      Config.loggedIn = true;

      Get.offNamed("/profile");

      final UserModel userModel = UserModel.fromJson(jsonDecode(res.body));

      Config.box.write("myId", userModel.id);

      return userModel;
    } else {
      throw Exception('Failed to Login.');
    }
  }

  // Update User
  Future<void> updateUser(String updatePart, String updateValue) async {
    final String userId = Config.box.read("myId");
    final res = await http.put(
      Uri.parse('${endPointUrl}api/users/$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userId': userId,
        updatePart: "$updateValue",
      }),
    );

    if (res.statusCode == 200) {
      Get.snackbar('تغییر ${updatePart} موفقیت آمیز بود',
          'حالا می تونی با خیال راحت ازش استفاده کنی!');
    } else {
      Get.snackbar('تغییر ${updatePart} موفقیت آمیز نبود :(',
          'لطفا دوباره امتحان کن. اگه بازم نتونستی حتما بهمون خبر بده!');
    }
  }

  // Get a User
  Future<UserModel> getUser(String userId) async {
    final res = await http.get(
      Uri.parse('${endPointUrl}api/users/$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (res.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return UserModel.fromJson(jsonDecode(res.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to get user!');
    }
  }

  // Get User Coupons
  Future<List<CouponModel>> getUserCoupon(String userId) async {
    final res = await http.get(
      Uri.parse('${endPointUrl}api/users/$userId/coupons'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (res.statusCode == 200) {
      List jsonResponse = json.decode(res.body);

      return jsonResponse.map((job) => CouponModel.fromJson(job)).toList();
    } else {
      throw Exception('Failed to get coupons.');
    }
  }

  // Timeline Coupons
  Future<List<CouponModel>> timelineCoupons(String userId) async {
    final res = await http.get(
      Uri.parse('${endPointUrl}api/coupons/$userId/timeline'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (res.statusCode == 200) {
      List jsonResponse = json.decode(res.body);
      return jsonResponse.map((job) => CouponModel.fromJson(job)).toList();
    } else {
      throw Exception('Failed to get coupons.');
    }
  }

  // Get All Coupons
  Future<List<CouponModel>> allCoupons() async {
    final res = await http.get(
      Uri.parse('${endPointUrl}api/coupons/all/coupons'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (res.statusCode == 200) {
      List jsonResponse = json.decode(res.body);
      return jsonResponse.map((job) => CouponModel.fromJson(job)).toList();
    } else {
      throw Exception('Failed to get coupons.');
    }
  }
}
