import 'package:flutter/material.dart';
import 'package:insta_clone/utils/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: LightThemeColors.primaryColor,
    scaffoldBackgroundColor: LightThemeColors.mobileBackgroundColor,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: LightThemeColors.primaryTextColor,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: DarkThemeColors.primaryColor,
    scaffoldBackgroundColor: DarkThemeColors.mobileBackgroundColor,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: DarkThemeColors.primaryTextColor,
      ),
      // Add more text styles as needed
    ),
  );
}
