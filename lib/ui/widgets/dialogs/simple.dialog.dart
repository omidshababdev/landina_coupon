import 'package:flutter/material.dart';
import 'package:get/get.dart';

landinaModal(Widget child, BuildContext context) async {
  return Get.dialog(
    AlertDialog(
      content: Text("data"),
    ),
  );
}
