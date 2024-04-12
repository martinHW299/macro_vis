import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

Future<File?> pickImageFromGallery(BuildContext context) async {
  final ImagePicker picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile == null) return null;

  return File(pickedFile.path);
}

Future<File?> pickImageFromCamera(BuildContext context) async {
  final ImagePicker picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.camera);

  if (pickedFile == null) return null;

  return File(pickedFile.path);
}
