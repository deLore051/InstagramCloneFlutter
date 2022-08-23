import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/Managers/auth_manager.dart';
import '../Widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColorToUse = Colors.amber.shade300;

    return GestureDetector(
      onTap: () {
        return FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 32
            ),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                      bottom: 20,
                    ),
                    child: SvgPicture.asset(
                      "assets/ic_instagram.svg", 
                      color: primaryColorToUse, 
                      height: 64,
                    ),
                  ),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1661213771748-db6d422c3c23?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" 
                        ),
                      ),
                      Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                          color: primaryColorToUse,
                          onPressed: () {
                            
                          },
                          icon: const Icon(Icons.add_a_photo),
                        )
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                  ),
                  TextFieldInput(
                    "Enter your username", 
                    false, 
                    _usernameController, 
                    TextInputType.text
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldInput(
                    "Enter your email", 
                    false, 
                    _emailController, 
                    TextInputType.emailAddress
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldInput(
                    "Enter your password", 
                    true, 
                    _passwordController, 
                    TextInputType.text
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldInput(
                    "Enter your bio", 
                    false, 
                    _bioController, 
                    TextInputType.text
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(10, 40, 10, 20),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(10)
                        ),
                        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if(states.contains(MaterialState.pressed)) {
                              return primaryColorToUse.withOpacity(0.3);
                            } 
                            return primaryColorToUse;
                          }
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: primaryColorToUse)
                        )), 
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        return print("sign up pressed");
                      },
                    ),
                              ),
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}