import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextFields extends StatelessWidget {
  final String hint;
  final Icon icon;
  final TextEditingController controller;
  const CustomTextFields({
    Key? key,
    required this.hint,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: icon,
        hintText: hint,
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.blue,
        )),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hint';
        } else {
          return null;
        }
      },
      autocorrect: true,
    );
  }
}
