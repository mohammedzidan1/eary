import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUtil {
  static String? path;
  static XFile? image;
  static getImage() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    path = image?.path;
    debugPrint('path : ${image?.path}');
  }
}
