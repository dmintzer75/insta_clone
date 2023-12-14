import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String username;
  final String bio;
  final String uid;
  final String photoUrl;
  final List<dynamic> followers;
  final List<dynamic> following;

  User({
    required this.email,
    required this.username,
    required this.bio,
    required this.uid,
    required this.photoUrl,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "bio": bio,
        "uid": uid,
        "photoUrl": photoUrl,
        "followers": followers,
        "following": following,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        username: json["username"],
        bio: json["bio"],
        uid: json["uid"],
        photoUrl: json["photoUrl"],
        followers: json["followers"],
        following: json["following"],
      );

  factory User.fromSnap(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return User(
      email: data['email'],
      username: data['username'],
      bio: data['bio'],
      uid: data['uid'],
      photoUrl: data['photoUrl'],
      followers: List<String>.from(data['followers']),
      following: List<String>.from(data['following']),
    );
  }

  factory User.empty() {
    return User(
      email: '',
      username: '',
      bio: '',
      uid: '',
      photoUrl: '',
      followers: [],
      following: [],
    );
  }
}
