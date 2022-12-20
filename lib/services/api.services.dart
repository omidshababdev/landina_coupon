import 'dart:convert';

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
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
    } catch (e) {
      //
    }
  }

  // Login User
  Future loginUser(String username, String password) async {
    await Future.delayed(const Duration(milliseconds: 4000));

    final res = await http.post(
      Uri.parse('${endPointUrl}api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
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

        final UserModel userModel = UserModel.fromJson(jsonDecode(res.body));

        Config.box.write("myId", userModel.id);

        return userModel;
      } else {
        return "Failed to Login.";
      }
    } catch (err) {
      return err;
    }
  }

  // Update User
  Future updateUser(String updatePart, String updateValue) async {
    await Future.delayed(const Duration(milliseconds: 4000));
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
  Future getUser(String userId) async {
    await Future.delayed(const Duration(milliseconds: 4000));

    final res = await http.get(
      Uri.parse('${endPointUrl}api/users/$userId'),
    );

    if (res.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return UserModel.fromJson(jsonDecode(res.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      return res.body;
    }
  }

  // Get User Coupons
  Future getUserCoupon(String userId) async {
    final res = await http.get(
      Uri.parse('${endPointUrl}api/users/$userId/coupons'),
    );

    if (res.statusCode == 200) {
      List jsonResponse = json.decode(res.body);

      return jsonResponse.map((job) => CouponModel.fromJson(job)).toList();
    } else if (res.statusCode == 404) {
      return null;
    } else {
      throw Exception('Failed to get coupons.');
    }
  }

  // Timeline Coupons
  Future timelineCoupons(String userId) async {
    final res = await http.get(
      Uri.parse('${endPointUrl}api/coupons/$userId/timeline'),
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
      throw Exception('Failed to get coupons.');
    }
  }

  // Create a Coupon
  Future createCoupon(
      String name, String code, String category, String desc) async {
    final res = await http.post(
      Uri.parse('${endPointUrl}api/coupons'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userId': Config.box.read("myId"),
        'name': name,
        'code': code,
        'category': category,
        'desc': desc,
      }),
    );

    if (res.statusCode == 200) {
      Get.back();

      Get.snackbar("کوپن با موفقیت ایجاد شد",
          "از داخل حسابت می تونی همه کوپن هایی که ایجاد کردی رو ببینی.");
    } else {
      return "Failed to Login.";
    }
  }

  // Delete a Coupon
  Future deleteCoupon(String couponId) async {
    final res = await http.delete(
      Uri.parse('${endPointUrl}api/coupons/$couponId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userId': Config.box.read("myId"),
      }),
    );

    if (res.statusCode == 200) {
      Get.snackbar("کوپن با موفقیت حذف شد",
          "هر وقت خواستی می تونی دوباره یک کوپن جدید بسازی ...");
    } else {
      Get.snackbar("حذف کوپن انجام نشد!", "باید دوباره امتحان کنی.");
    }
  }

  // Get All Coupons
  Future allCoupons() async {
    await Future.delayed(const Duration(milliseconds: 4000));

    final res = await http.get(
      Uri.parse('${endPointUrl}api/coupons/all/coupons'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (res.statusCode == 200) {
      List jsonResponse = json.decode(res.body);

      return jsonResponse
          .map<CouponModel>((job) => CouponModel.fromJson(job))
          .toList();
    } else if (res.statusCode == 404) {
      return null;
    } else {
      throw Exception('Failed to get coupons.');
    }
  }
}
