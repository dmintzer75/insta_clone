import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_clone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // Sign up user with email and password
  Future<String> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error ocurred";
    if (email.isEmpty || password.isEmpty || username.isEmpty || bio.isEmpty) {
      return "All fields must be filled";
    }

    try {
      // register user in firebase auth
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // add image to firebase storage
      String photoUrl = await StorageMethods().uploadImageToStorage("profile_images", file, false);

      // add user to database
      await _firestore.collection("users").doc(credential.user!.uid).set({
        "username": username,
        "email": email,
        "bio": bio,
        "uid": credential.user!.uid,
        "followers": [],
        "following": [],
        'photoUrl': photoUrl,
      });
      res = 'success';
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = 'Invalid email';
      } else if (err.code == 'email-already-in-use') {
        res = 'Email already in use';
      } else if (err.code == 'weak-password') {
        res = 'Weak password';
      } else {
        res = err.toString();
      }
    }
    return res;
  }

  // Sign in user with email and password
  Future<String> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    String res = "Some error ocurred";
    if (email.isEmpty || password.isEmpty) {
      return "All fields must be filled";
    }

    try {
      // register user in firebase auth
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      res = 'success';
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        res = 'Invalid email';
      } else if (err.code == 'user-not-found') {
        res = 'User not found';
      } else if (err.code == 'wrong-password') {
        res = 'Wrong password';
      } 
    }
    return res;
  }
}
