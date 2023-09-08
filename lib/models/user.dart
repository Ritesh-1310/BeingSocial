import 'package:cloud_firestore/cloud_firestore.dart';

// The User class represents a user object in your app.
class User {
  // Various properties of this User object
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;

  // A constructor that initializes the properties of a User object.
  const User(
      {required this.username,
      required this.uid,
      required this.photoUrl,
      required this.email,
      required this.bio,
      required this.followers,
      required this.following});


  // The fromSnap method is a factory method that takes a DocumentSnapshot as a 
  // parameter and returns a User object. 
  // It retrieves data from the snapshot and creates a User object using that data.
  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      bio: snapshot["bio"],
      followers: snapshot["followers"],
      following: snapshot["following"],
    );
  }

  // The toJson method is used to convert a User object into a JSON format. 
  // This is useful when you want to store a User object as a document in Firestore.
  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "bio": bio,
        "followers": followers,
        "following": following,
      };
}
