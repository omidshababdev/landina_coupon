import 'package:get_storage/get_storage.dart';
import 'package:landina_coupon/models/coupon.dart';
import 'package:landina_coupon/models/user.dart';
import 'package:landina_coupon/services/api.services.dart';

class Config {
  Config._();
  static bool loggedIn = false;
  static bool inProfile = false;

  static ApiService client = ApiService();

  static GetStorage box = GetStorage();

  static Future<UserModel>? userInfo;
}
