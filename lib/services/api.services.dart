import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/models/coupon.model.dart';
import 'package:landina_coupon/models/login.model.dart';
import 'package:landina_coupon/models/user.model.dart';

import 'package:get/get.dart';
import 'package:landina_coupon/ui/pages/home/home.dart';

class ApiService {
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
        Get.snackbar(res.statusCode.toString(), res.body.toString());
        return "Failed to Register.";
      }
    } catch (err) {
      print(err);
      Get.snackbar("Failed to Register", "$err");
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
        Get.snackbar("ورود با موفقیت انجام نشد", "واقعا متاسفیم :(");

        return "Failed to Login.";
      }
    } catch (err) {
      Get.snackbar("یک خطایی رخ داده", err.toString());
      return err;
    }
  }

  // Update User
  Future updateUser(String updatePart, String updateValue) async {
    await Future.delayed(const Duration(milliseconds: 4000));
    final String userId = Config.box.read("myId");
    final String userToken = Config.box.read("myToken");
    final res = await http.put(
      Uri.parse('${Config.baseUrl}users/$userId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': userToken
      },
      body: jsonEncode(<String, String>{
        updatePart: "$updateValue",
      }),
    );

    try {
      if (res.statusCode == 200) {
        Get.snackbar('تغییر $updatePart} موفقیت آمیز بود',
            'حالا می تونی با خیال راحت ازش استفاده کنی!');
      } else {
        Get.snackbar('تغییر $updatePart موفقیت آمیز نبود :(',
            'لطفا دوباره امتحان کن. اگه بازم نتونستی حتما بهمون خبر بده!');
      }
    } catch (err) {
      return err;
    }
  }

  // Get a User
  Future getUser(String? userId) async {
    await Future.delayed(const Duration(milliseconds: 4000));

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
  Future getUserCoupon(String userId) async {
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

  // Delete User
  Future deleteUser(String userId) async {
    final res = await http.delete(
      Uri.parse('${Config.baseUrl}api/users/$userId'),
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

        Get.snackbar("حساب کاربری با موفقیت حذف شد",
            "هر وقت خواستی می تونی دوباره یک حساب جدید بسازی ...");

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
      Uri.parse('${Config.baseUrl}api/coupons/$userId/timeline'),
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
      Uri.parse('${Config.baseUrl}api/coupons'),
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

    try {
      if (res.statusCode == 200) {
        Get.back();

        Get.snackbar("کوپن با موفقیت ایجاد شد",
            "از داخل حسابت می تونی همه کوپن هایی که ایجاد کردی رو ببینی.");
      } else {
        return "Failed to create coupon.";
      }
    } catch (err) {
      return err;
    }
  }

  // Delete a Coupon
  Future deleteCoupon(String couponId) async {
    final res = await http.delete(
      Uri.parse('${Config.baseUrl}api/coupons/$couponId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userId': Config.box.read("myId"),
      }),
    );

    try {
      if (res.statusCode == 200) {
        Get.snackbar("کوپن با موفقیت حذف شد",
            "هر وقت خواستی می تونی دوباره یک کوپن جدید بسازی ...");
      } else {
        Get.snackbar("حذف کوپن انجام نشد!", "باید دوباره امتحان کنی.");
      }
    } catch (err) {
      return err;
    }
  }

  // Get All Coupons
  Future allCoupons() async {
    await Future.delayed(const Duration(milliseconds: 4000));

    final res = await http.get(
      Uri.parse('${Config.baseUrl}coupons'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    try {
      if (res.statusCode == 200) {
        List jsonResponse = json.decode(res.body);

        return jsonResponse
            .map<CouponModel>((job) => CouponModel.fromJson(job))
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
