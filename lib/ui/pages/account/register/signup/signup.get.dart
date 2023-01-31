import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/services/notification.services.dart';
import 'package:landina_coupon/services/signup.service.dart';

class SignUpGet extends GetxController {
  var username = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

  var isLoading = false.obs;

  var passwordVisible = false.obs;

  void verifyUsername() {
    //
  }

  void verifyEmail() {
    //
  }

  void createAccount() async {
    if (username.value.isEmpty ||
        email.value.isEmpty ||
        password.value.isEmpty) {
      landinaNotification(
        "landina_notifications_channel",
        "Error",
        "Please enter all the fields",
      );

      return;
    }

    if (!isLoading.value) {
      isLoading.value = true;

      try {
        final service = SignUpService();
        final result = await service.call({
          'username': username.value,
          'email': email.value,
          'password': password.value,
        });

        isLoading.value = false;

        print(result);

        if (result) {
          landinaNotification(
            "landina_notifications_channel",
            "Success",
            result.toString(),
          );
        }
      } catch (err) {
        landinaNotification(
          "landina_notifications_channel",
          "Error",
          err.toString(),
        );

        isLoading.value = false;
      }
    }
  }
}
