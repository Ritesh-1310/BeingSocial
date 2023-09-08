import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // This method is used to upload an image represented as a Uint8List to Firebase Storage.
  Future<String> uploadImageToStorage(String childName, Uint8List file, bool isPost) async {
    
    // Creates a Reference object representing the location where the
    // image will be stored in Firebase Storage.
    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);

    // If the isPost parameter is true, it generates a unique ID using the Uuid 
    // package and creates a child location under childName using this ID.
    if(isPost) {
      String id = const Uuid().v1();
      ref = ref.child(id);
    }

    // The image data is uploaded to the storage location using the putData method of Reference, which takes the Uint8List containing the image data as the argument.
    UploadTask uploadTask = ref.putData(
      file
    );

    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
