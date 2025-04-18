import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_chat_app/config/helper/app_helper.dart';

class AppTheme {
  // Define the primary color
  static const primaryColor = Color(0xff692960);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // Colors
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: Color(0xFF8E8E93),
      surface: Colors.white,
      onSurface: Colors.black,
      // Adding complementary colors that work well with #acdde0
      tertiary: Color(0xFF7CBEC2), // Slightly darker shade for depth
      onPrimary:
          Colors.black87, // Dark text on primary color for better contrast
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: SizeConfig.screenHeight * 0.02,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: const IconThemeData(color: Colors.black),
    ),

    // Input Decoration
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: primaryColor.withOpacity(0.1),
      contentPadding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth * 0.02,
        vertical: SizeConfig.screenHeight * 0.01,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(24),
        borderSide: const BorderSide(color: primaryColor),
      ),
      hintStyle: TextStyle(
        color: Colors.grey[600],
        fontSize: SizeConfig.screenHeight * 0.017,
      ),
    ),

    // Message Bubbles
    cardTheme: CardTheme(
      color: primaryColor.withOpacity(0.1),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),

    // Icons
    iconTheme: IconThemeData(
      color: Colors.black87,
      size:  SizeConfig.screenWidth*0.06,
    ),

    // Text Themes
    textTheme: GoogleFonts.poppinsTextTheme(),

    // Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.black87,
        elevation: 0,
        padding:
            EdgeInsets.symmetric(vertical: SizeConfig.screenHeight * 0.019),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: TextStyle(
          fontSize: SizeConfig.screenHeight * 0.019,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
