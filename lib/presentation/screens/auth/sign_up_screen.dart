import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:real_chat_app/config/helper/app_helper.dart';
import 'package:real_chat_app/core/common/custom_button.dart';
import 'package:real_chat_app/core/common/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _nameFocus = FocusNode();
  final _usernameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _phoneFocus = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //name validator
  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter Full Name";
    } else if (value.length < 6) {
      return "Please enter Full Name";
    }
    return null;
  }

  //username validator
  String? _usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter username";
    } else if (value.length >= 10) {
      return "Please enter valid username";
    }
    return null;
  }

  //email validator
  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter email";
    } else if (!EmailValidator.validate(value.trim())) {
      return "Please enter a valid email";
    }
    return null;
  }

  //phonenumber validator
  String? _phonenumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter phonenumber";
    }
    final phoneRegex = RegExp(r'^\+?[\d\s-]{10,}$');

    if (value.length != 10) {
      return "Please enter 10 digit phonenumber";
    } else {
      if (phoneRegex.hasMatch(value)) {
        return null;
      } else {
        return "Please enter valid phonenumber";
      }
    }
  }

  //password validator
  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }

    // Check length
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Check for at least one uppercase letter
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must have at least one uppercase letter';
    }

    // Check for at least one special character
    if (!RegExp(r'[!@#\$&*~%^(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must have at least one special character';
    }

    // Check for at least one digit
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must have at least one number';
    }

    return null; // Password is valid
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Welcome Text
                Text(
                  "Create Account",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                //10
                SizedBox(height: SizeConfig.screenHeight * 0.01),

                //Continue text
                Text(
                  "Please fill in the details to continue",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),

                //30
                SizedBox(height: SizeConfig.screenHeight * 0.035),

                //Custom TextField for Full Name
                CustomTextfield(
                  focusNode: _nameFocus,
                  validator: _nameValidator,
                  prefexIcon: const Icon(Icons.person_outline),
                  controller: _nameController,
                  hintText: "Full Name",
                  keyBoardType: TextInputType.text,
                ),

                //17
                SizedBox(height: SizeConfig.screenHeight * 0.02),

                //Custom Textfiled for username
                CustomTextfield(
                  focusNode: _usernameFocus,
                  validator: _usernameValidator,
                  prefexIcon: const Icon(Icons.alternate_email_outlined),
                  controller: _usernameController,
                  hintText: "Username",
                  keyBoardType: TextInputType.text,
                ),

                SizedBox(height: SizeConfig.screenHeight * 0.02),

                //Custom Textfiled for email
                CustomTextfield(
                  focusNode: _emailFocus,
                  validator: _emailValidator,
                  prefexIcon: const Icon(Icons.email_outlined),
                  controller: _emailController,
                  hintText: "Email",
                  keyBoardType: TextInputType.emailAddress,
                ),

                SizedBox(height: SizeConfig.screenHeight * 0.02),

                //Custom Textfiled for phonenumber
                CustomTextfield(
                  focusNode: _phoneFocus,
                  validator: _phonenumberValidator,
                  prefexIcon: const Icon(Icons.phone_outlined),
                  controller: _phoneController,
                  hintText: "Phonenumber",
                  keyBoardType: TextInputType.number,
                ),

                SizedBox(height: SizeConfig.screenHeight * 0.02),

                //Custom Textfiled for password
                CustomTextfield(
                  focusNode: _passwordFocus,
                  validator: _passwordValidator,
                  prefexIcon: const Icon(Icons.lock_outline),
                  sufixIcon: const Icon(Icons.visibility),
                  controller: _passwordController,
                  hintText: "Password",
                  keyBoardType: TextInputType.text,
                ),

                //17
                SizedBox(height: SizeConfig.screenHeight * 0.035),

                //Login Button
                CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        debugPrint("SIgnup Sucess");
                      }
                    },
                    text: "Create Account"),

                SizedBox(height: SizeConfig.screenHeight * 0.045),

                //Signup text buttoon
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pop(context);
                            },
                          text: "Login",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
