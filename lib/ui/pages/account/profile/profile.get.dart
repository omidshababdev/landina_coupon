import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/services/upload.service.dart';

class ProfileGet extends GetxController {
  Rx<File?> profileImage = File('').obs;

  Future uploadImage(ImageSource source) async {
    final imagePicker = ImagePicker();

    try {
      final XFile? pickedFile = await imagePicker.pickImage(
        source: source,
        maxWidth: 300,
        maxHeight: 300,
      );

      if (pickedFile != null) {
        final uploadService = UploadServices();
        final uploadResult = await uploadService.call({
          'userId': Config.box.read("myId"),
          'profile': pickedFile.path,
        });
        if (uploadResult) {
          profileImage.value = File(pickedFile.path);
        }
      }
    } on PlatformException catch (err) {
      return "ای وای نتونستیم عکس رو بگیریم: $err";
    }
  }
}
