import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpGet extends GetxController {
  var username = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

  var isLoading = false.obs;

  var passwordVisible = false.obs;
}
