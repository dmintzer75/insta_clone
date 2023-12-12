import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final image = await ImagePicker().pickImage(source: source);

  if (image != null) {
    return image.readAsBytes();
  }
}


showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(child: Text(text)),
    ),
  );
}