import 'package:flutter/material.dart';
import 'package:real_chat_app/config/theme/app_theme.dart';
import 'package:real_chat_app/presentation/screens/auth/login_screen.dart';

import 'config/helper/app_helper.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // Initialize once at app start
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Messanger App',
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}
