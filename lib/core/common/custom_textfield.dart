// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? prefexIcon;
  final Widget? sufixIcon;

  final TextInputType keyBoardType;
  final FocusNode? focusNode;
  final bool isPassword;
  final String? Function(String?)? validator;
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefexIcon,
    this.sufixIcon,
    required this.keyBoardType,
    this.focusNode,
    this.isPassword = false,
    this.validator,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obsecureText,
      validator: widget.validator,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefexIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obsecureText = !obsecureText;
                  });
                },
                icon: obsecureText
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off))
            : null,
      ),
    );
  }
}
