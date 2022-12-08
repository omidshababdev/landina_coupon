import 'package:landina_coupon/services/api.services.dart';

class Config {
  Config._();
  static bool loggedIn = false;
  static bool inProfile = false;

  static ApiService client = ApiService();
}
