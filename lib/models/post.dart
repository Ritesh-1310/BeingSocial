import 'package:cloud_firestore/cloud_firestore.dart';

// The Post class represents a post object in your app
class Post {
  // Various properties of this Post object
  final String description;
  final String uid;
  final String username;
  final likes;
  final String postId;
  final DateTime datePublished;
  final String postUrl;
  final String profImage;

  // A constructor that initializes the properties of the Post object.
  const Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.likes,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
  });

  // The fromSnap method is a factory method that takes a DocumentSnapshot as a 
  // parameter and returns a Post object. 
  // It retrieves data from the snapshot and creates a Post object using that data.
  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
        description: snapshot["description"],
        uid: snapshot["uid"],
        likes: snapshot["likes"],
        postId: snapshot["postId"],
        datePublished: snapshot["datePublished"],
        username: snapshot["username"],
        postUrl: snapshot['postUrl'],
        profImage: snapshot['profImage']);
  }

  // The toJson method is being used to convert a Post object into a JSON format.
  // This is useful when you want to store a Post object as a document in Firestore.
  Map<String, dynamic> toJson() => {
        "description": description,
        "uid": uid,
        "likes": likes,
        "username": username,
        "postId": postId,
        "datePublished": datePublished,
        'postUrl': postUrl,
        'profImage': profImage
      };
}
