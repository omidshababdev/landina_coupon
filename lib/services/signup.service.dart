import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/services/base.service.dart';
import 'package:landina_coupon/services/notification.services.dart';

class SignUpService extends BaseService {
  final Uri url = Uri.parse('${Config.baseUrl}/auth/register');

  @override
  Future<bool> call(Map<String, dynamic> args) async {
    final client = http.Client();
    final response = await client.post(url, body: args);
    final decodedResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      landinaNotification(
        "error_channel",
        "Error",
        decodedResponse,
      );

      return false;
    }
  }
}
