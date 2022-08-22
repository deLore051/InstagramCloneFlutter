import 'package:flutter/material.dart';
import 'package:instagram_clone/Resources/colors.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPassword;
  final String hintText;
  final TextInputType textInputType;

  TextFieldInput(
    this.hintText, 
    this.isPassword, 
    this.textEditingController, 
    this.textInputType
  );

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: primaryColor,
        width: 2,
        style: BorderStyle.solid
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(25)
      ),
    );


    return TextField(
      autocorrect: false,
      obscureText: isPassword,
      keyboardType: textInputType,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10)
      ),
    );
  }
}