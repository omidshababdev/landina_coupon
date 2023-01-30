import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/services/base.service.dart';
import 'package:landina_coupon/services/notification.services.dart';

class UploadServices extends BaseService {
  final Uri url = Uri.parse('${Config.baseUrl}upload/profile');
  Future<bool> call(Map<String, dynamic> args) async {
    try {
      final req = http.MultipartRequest('put', url)
        ..headers['Content-Type'] = 'multipart/form-data'
        ..headers['userId'] = Config.box.read("myId")
        ..headers['Authorization'] = Config.box.read("myToken");

      req.files
          .add(await http.MultipartFile.fromPath('profile', args['profile']));

      final response = await http.Response.fromStream(await req.send());
      final decodedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return true;
      } else {
        landinaNotification(
          "landina_notifications_channel",
          decodedResponse['error_code'],
          decodedResponse['message'],
        );
        return false;
      }
    } catch (err) {
      landinaNotification(
        "landina_notifications_channel",
        "Error",
        err.toString(),
      );
      return false;
    }
  }
}
