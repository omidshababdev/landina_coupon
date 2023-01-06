import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileGet extends GetxController {
  Rx<File?> profileImage = File(' ').obs;

  void uploadImage() async {
    final imagePicker = ImagePicker();
  }
}
