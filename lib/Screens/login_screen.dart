import 'dart:ffi';
import 'dart:ui';

import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/Resources/colors.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SvgPicture.asset(
                  "assets/ic_instagram.svg", 
                  color: Colors.amber.shade300, 
                  height: 64,
                ),
              ),
              SizedBox(
                height: 60,
                width: double.infinity,
              ),
              TextFieldInput(
                "Email", 
                false, 
                _emailController, 
                TextInputType.emailAddress
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldInput(
                "Password", 
                true, 
                _passwordController, 
                TextInputType.text
              ),
              Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(10, 40, 10, 20),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if(states.contains(MaterialState.pressed)) {
                        return Colors.blue.withOpacity(0.3);
                      } 
                      return Colors.blue;
                    }
                  ),
                ),
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium!.color
                  ),
                ),
                onPressed: () {
                  return print("log in pressed");
                },
              ),
            )
            // transitioning to sign up
            ],
          ),
        ),
      )
    );
  }
}