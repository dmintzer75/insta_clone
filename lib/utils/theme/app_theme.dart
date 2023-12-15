import 'package:flutter/material.dart';
import 'package:insta_clone/utils/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: LightThemeColors.primaryColor,
    disabledColor: LightThemeColors.secondaryColor,
    highlightColor: LightThemeColors.blueColor,
    dividerColor: LightThemeColors.secondaryColor,
    bottomAppBarTheme: const BottomAppBarTheme(
      color: LightThemeColors.bottomAppBarColor,
    ),
    colorScheme: const ColorScheme.light(
      primary: LightThemeColors.primaryColor,
      secondary: LightThemeColors.secondaryColor,
      tertiary: Color.fromRGBO(0, 149, 246, 1),
    ),
    scaffoldBackgroundColor: LightThemeColors.mobileBackgroundColor,
    textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: LightThemeColors.primaryTextColor,
        ),
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
        )),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: DarkThemeColors.primaryColor,
    scaffoldBackgroundColor: DarkThemeColors.mobileBackgroundColor,
    disabledColor: DarkThemeColors.secondaryColor,
    bottomAppBarTheme: const BottomAppBarTheme(
      color: DarkThemeColors.bottomAppBarColor,
      padding: EdgeInsets.only(top: 10),
    ),
    highlightColor: DarkThemeColors.blueColor,
    dividerColor: DarkThemeColors.secondaryColor,
    dialogBackgroundColor: DarkThemeColors.textInputColor,
    colorScheme: const ColorScheme.light(
        primary: DarkThemeColors.primaryColor,
        secondary: DarkThemeColors.secondaryColor,
        tertiary: DarkThemeColors.blueColor),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: DarkThemeColors.primaryTextColor,
      ),
      // Add more text styles as needed
    ),
  );
}
