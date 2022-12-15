import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      Get.snackbar(
          response.statusCode.toString(), jsonDecode(response.body)['msg']);
      break;
    case 500:
      Get.snackbar(
          response.statusCode.toString(), jsonDecode(response.body)['error']);
      break;
    default:
      Get.snackbar(response.statusCode.toString(), response.body);
  }
}
