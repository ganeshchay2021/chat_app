// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? prefexIcon;
  final Widget? sufixIcon;
  final bool obsecureText;
  final TextInputType keyBoardType;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyBoardType,
    this.prefexIcon,
    this.sufixIcon,
    this.obsecureText = false,
    this.focusNode,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureText,
      validator: validator,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefexIcon,
        suffixIcon: sufixIcon,
      ),
    );
  }
}
