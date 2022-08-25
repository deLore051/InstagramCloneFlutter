import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/Managers/auth_manager.dart';
import 'package:instagram_clone/Resources/utils.dart';
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
  Uint8List? _image;


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void signUpUser() async {
    String res = await AuthManager.shared.signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,
        bio: _bioController.text,
        image: _image!);
    if(res != "success") {
      showSnackBar(res, context);
    }

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
                      _image != null 
                      ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
                      )
                      : const CircleAvatar(
                        radius: 64,
                        backgroundImage: NetworkImage(
                          "https://thumbs.dreamstime.com/b/default-profile-picture-avatar-photo-placeholder-vector-illustration-default-profile-picture-avatar-photo-placeholder-vector-189495158.jpg" 
                        ),
                      ),
                      Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                          color: primaryColorToUse,
                          onPressed: () {
                            selectImage();
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
                      onPressed: signUpUser,
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