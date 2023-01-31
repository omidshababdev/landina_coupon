import 'package:http/http.dart' as http;
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/services/base.service.dart';

class SignUpService extends BaseService {
  final Uri url = Uri.parse('${Config.baseUrl}/auth/register');

  Future<bool> call(Map<String, dynamic> args) async {
    final client = http.Client();
    final response = await client.post(url, body: args);

    return false;
  }
}
