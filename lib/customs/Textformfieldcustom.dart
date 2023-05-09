import 'dart:async';
import 'Textformfieldcustom.dart';
import 'package:flutter/material.dart';


final myController = TextEditingController();

class Textformfieldcustom extends StatelessWidget {
  Widget? prefixIcon;
  TextInputType? keyboardType;
  InputBorder? border;
  int? hintMaxLines;
  Widget? suffixIcon;
  String? hintText;
  String? Function(String?)? validator;
  TextEditingController? controller;
  bool? obscureText;
  Textformfieldcustom(
      {super.key,
      this.controller,
      this.validator,
      this.hintText,
      this.suffixIcon,
      this.hintMaxLines,
      this.border,
      this.keyboardType,
      this.prefixIcon,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText?? false,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintMaxLines: hintMaxLines,
          border: border,
          prefixIcon: prefixIcon),
      keyboardType: keyboardType,
    );
  }
}