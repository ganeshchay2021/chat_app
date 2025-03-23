import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:real_chat_app/config/helper/app_helper.dart';
import 'package:real_chat_app/core/common/custom_button.dart';
import 'package:real_chat_app/core/common/custom_textfield.dart';
import 'package:real_chat_app/data/services/service_locator.dart';
import 'package:real_chat_app/presentation/screens/auth/sign_up_screen.dart';
import 'package:real_chat_app/router/app_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  //email validator
  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter email";
    } else if (!EmailValidator.validate(value.trim())) {
      return "Please enter a valid email";
    }
    return null;
  }

  //password validator
  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter password";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //30
                  SizedBox(height: SizeConfig.screenHeight * 0.055),

                  //Welcome Text
                  Text("Welcome Back",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
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
                      focusNode: _emailFocus,
                      keyBoardType: TextInputType.text,
                      validator: _emailValidator),

                  //17
                  SizedBox(height: SizeConfig.screenHeight * 0.02),

                  //Custom Textfiled for password
                  CustomTextfield(
                      isPassword: true,
                      sufixIcon: const Icon(Icons.visibility),
                      prefexIcon: const Icon(Icons.lock_outline),
                      controller: _passwordController,
                      hintText: "Password",
                      focusNode: _passwordFocus,
                      keyBoardType: TextInputType.text,
                      validator: _passwordValidator),

                  //17
                  SizedBox(height: SizeConfig.screenHeight * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(
                          recognizer: TapGestureRecognizer()..onTap=(){

                          },
                          text: "Forgot Password?",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.03),

                  //Login Button
                  CustomButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          debugPrint("Login Sucess");
                        }
                        FocusScope.of(context).unfocus();
                      },
                      text: "Login"),

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
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                getIt<AppRouter>().push(
                                  const SignUpScreen(),
                                );
                              },
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
      ),
    );
  }
}
