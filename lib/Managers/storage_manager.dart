import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageManager {
  StorageManager.privateConstructor();
  static final StorageManager _shared = StorageManager.privateConstructor();
  static StorageManager get shared => _shared;

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Method for adding an image to firebase storage
  Future<String> uploadImageToStorage(
    String childName, 
    Uint8List image, 
    bool isPost) async {
      Reference reference = _storage.ref()
        .child(childName)
        .child(_auth.currentUser!.uid);
  
      UploadTask uploadTask = reference.putData(image);
      TaskSnapshot snapshot = await uploadTask;
      String downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
  }

}