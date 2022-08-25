import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/Managers/storage_manager.dart';

class AuthManager {
  AuthManager._privateConstructor();
  static final AuthManager _shared = AuthManager._privateConstructor();

  static AuthManager get shared => _shared;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /* Method that we use to sign up the user */
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List image,
  }) async {
    String result = "Some error occured";
    try {
      if(email.isNotEmpty && 
        password.isNotEmpty && 
        username.isNotEmpty && 
        bio.isNotEmpty) {
          // Register user
          UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

          String photoURL = await StorageManager.shared.uploadImageToStorage(
            "profilePhotos", 
            image, 
            false
          );

          // Add user info to our database
          await _firestore.collection('users').doc(credential.user!.uid).set({
            "email": email,
            "uid": credential.user!.uid,
            "username": username,
            "bio": bio,
            "followers": [],
            "following": [],
            "profilePhotoURL": photoURL,
          });
          result = "success";
      }
    } on FirebaseAuthException catch(error) {
      result = error.code;
    } 
    return result;
  }
}