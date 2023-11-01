import 'package:flutter/material.dart';
import 'package:thread_clone/utils/colors.dart' as color;

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomTextField(
      {required this.hintText, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextField(
          controller: controller,
          obscureText: hintText == "Password" ? true : false,
          style: TextStyle(color: color.Colors.whiteColor),
          cursorColor: color.Colors.whiteColor,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: color.Colors.whiteColor)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: color.Colors.whiteColor)),
              hintText: hintText,
              hintStyle: TextStyle(color: color.Colors.whiteColor))),
    );
  }
}
