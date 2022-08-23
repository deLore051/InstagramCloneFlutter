import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthManager {
  AuthManager._privateConstructor();
  static final AuthManager _shared = AuthManager._privateConstructor();

  static AuthManager get shared => _shared;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  
}