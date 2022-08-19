import "package:flutter/material.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 32
          ),
          width: double.infinity,
          child: Column(
            children: [
              // svg image - logo
              // text field input for email
              // text field input for password
              // sign in button
              // transitioning to sign up
            ],
          ),
        ),
      )
    );
  }
}