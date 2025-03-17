import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:real_chat_app/config/helper/app_helper.dart';
import 'package:real_chat_app/core/common/custom_button.dart';
import 'package:real_chat_app/core/common/custom_textfield.dart';

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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.05),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //30
                SizedBox(height: SizeConfig.screenHeight * 0.055),

                //Welcome Text
                Text("Welcome Back",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                //10
                SizedBox(height: SizeConfig.screenHeight * 0.01),

                //Continue text
                Text(
                  "Sign in to continue",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                ),

                //30
                SizedBox(height: SizeConfig.screenHeight * 0.035),

                //Custom TextField for Email
                CustomTextfield(
                  prefexIcon: const Icon(Icons.email_outlined),
                  controller: _emailController,
                  hintText: "Email",
                  keyBoardType: TextInputType.text,
                ),

                //17
                SizedBox(height: SizeConfig.screenHeight * 0.02),

                //Custom Textfiled for password
                CustomTextfield(
                  sufixIcon: const Icon(Icons.visibility),
                  prefexIcon: const Icon(Icons.lock_outline),
                  controller: _passwordController,
                  hintText: "Password",
                  obsecureText: true,
                  keyBoardType: TextInputType.text,
                ),

                //17
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                        recognizer: TapGestureRecognizer(),
                        text: "Forgot Password?",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),

                //Login Button
                CustomButton(onPressed: () {}, text: "Login"),

                SizedBox(height: SizeConfig.screenHeight * 0.04),

                //Signup text buttoon
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer(),
                          text: "Sign Up",
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
