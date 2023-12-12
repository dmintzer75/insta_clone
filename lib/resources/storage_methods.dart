import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Add image to firebase storage
  Future<String> uploadImageToStorage(String path, Uint8List file, bool isPost) async {
    final snapshot = await _storage.ref().child(path).child(_auth.currentUser!.uid).putData(file);
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
