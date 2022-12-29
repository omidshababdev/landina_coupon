import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/models/login.model.dart';
import 'package:landina_coupon/services/base.service.dart';

abstract class LoginService extends BaseService {
  Future loginUser(String username, String password) async {
    final res = await http.post(
      Uri.parse('${Config.baseUrl}auth/login'),
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

        Get.snackbar("ورود با موفقیت انجام شد",
            "حالا خیلی راحت می تونی ازش استفاده کنی");

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
}
