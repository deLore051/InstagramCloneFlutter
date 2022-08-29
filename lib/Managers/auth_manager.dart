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
      } else {
        result = "All required fields must be filled up";
      }
    } catch(error) {
      switch (error.toString()) {
        case "auth/email-already-in-use":
          result = "The email addres that you entered is already in use!";
          break;
        case "auth/invalid-email":
          result = "The entered email is incorrect!";
          break;
        case "auth/weak-password":
          result = "The password must be at least 6 characters long!";
          break;
        case "auth/operation-not-allowed":
          result = "Operation not allowed!";
          break;  
        default:
      } 
    } 
    return result;
  }

  Future<String> logInUser({
    required String email,
    required String password
  }) async {
    String result = "Some error occured!";
    try {
      if(email.isNotEmpty && password.isNotEmpty) {
        _auth.signInWithEmailAndPassword(
          email: email, 
          password: password
        );
        result = "Success";
      } else {
        result = "Please fill all the required fields, before trying to sign in!";
      }
    } catch(error) {
      print(error.toString());
      switch(error.toString()) {
        case "firebase_auth/wrong-password":
          result = "The password you entered is invalid! Please try again.";
          break;
        case "firebase_auth/user-not-found":
          result = "There is no user account record with the entered email address! Please check if you entered the email address properly.123";
          break;
      }
    }
    return result;
  }


}