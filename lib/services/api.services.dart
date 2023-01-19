import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/models/coupon.model.dart';
import 'package:landina_coupon/models/link.model.dart';
import 'package:landina_coupon/models/login.model.dart';
import 'package:landina_coupon/models/notification.model.dart';
import 'package:landina_coupon/models/user.model.dart';

import 'package:get/get.dart';
import 'package:landina_coupon/services/notification.services.dart';
import 'package:landina_coupon/ui/pages/home/home.dart';

class ApiServices {
  // SignUp User
  Future signUpUser(String username, String email, String password) async {
    http.Response res =
        await http.post(Uri.parse('${Config.baseUrl}auth/register'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'username': username,
              'email': email,
              'password': password,
            }));

    try {
      if (res.statusCode == 200) {
        Config.box.write("username", username);
        Config.box.write("email", email);
        Config.box.write("password", password);

        final UserModel userModel = UserModel.fromJson(jsonDecode(res.body));
        Config.box.write("myId", userModel.id);

        Config.loggedIn = true;

        Get.offAll(HomePage());
        Get.toNamed('/profile');

        return userModel;
      } else {
        landinaNotification(
          "landina_notifications_channel",
          res.statusCode.toString(),
          res.body.toString(),
        );

        return "Failed to Register.";
      }
    } catch (err) {
      landinaNotification(
        "landina_notifications_channel",
        "ثبت نام موفقیت آمیز نبود!",
        "$err",
      );

      return err;
    }
  }

  // Login User
  Future loginUser(String username, String password) async {
    final res = await http.post(
      Uri.parse('${Config.baseUrl}auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    try {
      if (res.statusCode == 200) {
        Config.box.write("username", username);
        Config.box.write("password", password);

        Config.loggedIn = true;

        Get.offNamed("/profile");

        final LoginModel loginModel = LoginModel.fromJson(jsonDecode(res.body));

        Config.box.write("myToken", loginModel.token);
        Config.box.write("myId", loginModel.user!.id);

        return loginModel;
      } else {
        landinaNotification(
          "landina_notifications_channel",
          "ورود با موفقیت انجام نشد",
          "واقعا متاسفیم :(",
        );

        return "Failed to Login.";
      }
    } catch (err) {
      landinaNotification(
        "landina_notifications_channel",
        "یک خطایی رخ داده",
        err.toString(),
      );

      return err;
    }
  }

  // Update User
  Future updateUser(String updatePart, String updateValue) async {
    final String userId = Config.box.read("myId");
    final String userToken = Config.box.read("myToken");
    final res = await http.put(
      Uri.parse('${Config.baseUrl}users/$userId'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': userToken
      },
      body: jsonEncode({
        updatePart: "$updateValue",
      }),
    );

    try {
      if (res.statusCode == 200) {
        landinaNotification(
          "landina_notifications_channel",
          "ویرایش $updatePart موفقیت آمیز بود.",
          "اطلاعات بیشتر رو اینجا می تونی ببینی.",
        );
      } else {
        landinaNotification(
          "landina_notifications_channel",
          "ویرایش $updatePart موفقیت آمیز نبود.",
          "اطلاعات بیشتر رو اینجا می تونی ببینی.",
        );
      }
    } catch (err) {
      return err;
    }
  }

  // Get a User
  Future getUser(String? userId) async {
    final res = await http.get(
      Uri.parse('${Config.baseUrl}users/$userId'),
    );

    try {
      if (res.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return UserModel.fromJson(jsonDecode(res.body));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        return res.body;
      }
    } catch (err) {
      return err;
    }
  }

  // Get User Coupons
  Future getUserCoupons(String userId) async {
    final res = await http.get(
      Uri.parse('${Config.baseUrl}users/$userId/coupons'),
    );

    try {
      if (res.statusCode == 200) {
        List jsonResponse = json.decode(res.body);

        return jsonResponse.map((job) => CouponModel.fromJson(job)).toList();
      } else if (res.statusCode == 404) {
        return null;
      } else {
        return 'Failed to get coupons.';
      }
    } catch (err) {
      return err;
    }
  }

  // Get User Links
  Future getUserLinks(String userId) async {
    final res = await http.get(
      Uri.parse('${Config.baseUrl}users/$userId/links'),
    );

    try {
      if (res.statusCode == 200) {
        List jsonResponse = json.decode(res.body);

        return jsonResponse.map((job) => LinkModel.fromJson(job)).toList();
      } else if (res.statusCode == 404) {
        return null;
      } else {
        return 'Failed to get links.';
      }
    } catch (err) {
      return err;
    }
  }

// Get User Links
  Future getUserNotif(String userId) async {
    final res = await http.get(
      Uri.parse('${Config.baseUrl}users/$userId/notifications'),
    );

    try {
      if (res.statusCode == 200) {
        List jsonResponse = json.decode(res.body);

        return jsonResponse.map((job) => NotifModel.fromJson(job)).toList();
      } else if (res.statusCode == 404) {
        return null;
      } else {
        return 'Failed to get notifications.';
      }
    } catch (err) {
      return err;
    }
  }

// Update Link
  Future updateLink(
      String linkId, String updatePart, String updateValue) async {
    final String userToken = Config.box.read("myToken");
    final res = await http.put(
      Uri.parse('${Config.baseUrl}links/$linkId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': userToken
      },
      body: jsonEncode({
        "userId": Config.box.read("myId"),
        updatePart: "$updateValue",
      }),
    );
  }

  // Delete User
  Future deleteUser(String userId) async {
    final res = await http.delete(
      Uri.parse('${Config.baseUrl}users/$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userId': userId,
      }),
    );

    try {
      if (res.statusCode == 200) {
        Config.box.remove("username");
        Config.box.remove("email");
        Config.box.remove("password");

        Config.loggedIn = false;

        Config.box.remove("myId");

        landinaNotification(
          "landina_notifications_channel",
          "حساب کاربری با موفقیت حذف شد",
          "هر وقت خواستی می تونی دوباره یک حساب جدید بسازی ...",
        );

        Get.offAll(HomePage());
        Get.toNamed('/home');
      } else {
        return "Failed to delete account";
      }
    } catch (err) {
      return err;
    }
  }

  // Timeline Coupons
  Future timelineCoupons(String userId) async {
    final res = await http.get(
      Uri.parse('${Config.baseUrl}coupons/$userId/timeline'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (res.statusCode == 200) {
      List jsonResponse = await json.decode(res.body);

      return jsonResponse.map((job) => CouponModel.fromJson(job)).toList();
    } else if (res.statusCode == 404) {
      return null;
    } else {
      return "Failed to get coupons.";
    }
  }

  // Create a Coupon
  Future createCoupon(
      String name, String code, String category, String desc) async {
    final res = await http.post(
      Uri.parse('${Config.baseUrl}coupons'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": Config.box.read("myToken")
      },
      body: jsonEncode(<String, String>{
        'userId': Config.box.read("myId"),
        'name': name,
        'code': code,
        'category': category,
        'desc': desc,
      }),
    );

    try {
      if (res.statusCode == 200) {
        Get.back();

        landinaNotification(
          "landina_notifications_channel",
          "کوپن با موفقیت ایجاد شد",
          "از داخل حسابت می تونی همه کوپن هایی که ایجاد کردی رو ببینی.",
        );
      } else {
        return "Failed to create coupon.";
      }
    } catch (err) {
      return err;
    }
  }

  // Follow User
  Future followUser(String id) async {
    final String userId = Config.box.read("myId");
    final String userToken = Config.box.read("myToken");
    final res = await http.put(
      Uri.parse('${Config.baseUrl}users/$userId/follow/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': userToken
      },
    );
    print(res.body);
  }

  // Unfollow User
  Future unfollowUser(String id) async {
    final String userId = Config.box.read("myId");
    final String userToken = Config.box.read("myToken");
    final res = await http.put(
      Uri.parse('${Config.baseUrl}users/$userId/unfollow/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': userToken
      },
    );
    print(res.body);
  }

// Get Followed User
  Future<bool> getFollowedUser(String userId, String id) async {
    final res = await http.get(
      Uri.parse('${Config.baseUrl}users/$userId/followed/$id'),
    );
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // Delete a Coupon
  Future deleteCoupon(String couponId) async {
    final res = await http.delete(
      Uri.parse('${Config.baseUrl}coupons/$couponId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userId': Config.box.read("myId"),
      }),
    );

    try {
      if (res.statusCode == 200) {
        landinaNotification(
          "landina_notifications_channel",
          "کوپن با موفقیت حذف شد",
          "هر وقت خواستی می تونی دوباره یک کوپن جدید بسازی ...",
        );
      } else {
        landinaNotification(
          "landina_notifications_channel",
          "حذف کوپن انجام نشد!",
          "باید دوباره امتحان کنی.",
        );
      }
    } catch (err) {
      return err;
    }
  }

  // Search Coupons
  static Future searchCoupons(String? query) async {
    final res = await http.get(
      Uri.parse('${Config.baseUrl}coupons/$query'),
    );

    try {
      if (res.statusCode == 200) {
        final List coupons = json.decode(res.body);

        return coupons.map((json) => CouponModel.fromJson(json)).toList();
      } else if (res.statusCode == 404) {
        return null;
      } else {
        return 'Failed to get coupons.';
      }
    } catch (err) {
      return err;
    }

    // return searchCoupons(query);
  }

  // Get User Followers
  Future getUserFollowers(String? userId) async {
    final res = await http.get(
      Uri.parse('${Config.baseUrl}users/$userId/followers'),
    );

    try {
      if (res.statusCode == 200) {
        List jsonResponse = json.decode(res.body);

        return jsonResponse
            .map<UserModel>((job) => UserModel.fromJson(job))
            .toList();
      } else if (res.statusCode == 404) {
        return null;
      } else {
        return 'Failed to get coupons.';
      }
    } catch (err) {
      return err;
    }
  }

  // Get User Followers
  Future getUserFollowings(String? userId) async {
    final res = await http.get(
      Uri.parse('${Config.baseUrl}users/$userId/followings'),
    );

    try {
      if (res.statusCode == 200) {
        List jsonResponse = json.decode(res.body);

        return jsonResponse
            .map<UserModel>((job) => UserModel.fromJson(job))
            .toList();
      } else if (res.statusCode == 404) {
        return null;
      } else {
        return 'Failed to get coupons.';
      }
    } catch (err) {
      return err;
    }
  }
}
