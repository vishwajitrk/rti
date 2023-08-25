import 'package:flutter/material.dart';

class AppSizes {
  static const int titleFontSize = 34;
}

class AppColors {
  static const red = Color(0xFFDB3022);
  static const black = Color(0xFF222222);
  static const lightGray = Color(0xFF9B9B9B);
  static const darkGray = Color.fromARGB(255, 57, 57, 57);
  static const white = Color(0xFFFFFFFF);
  static const orange = Color(0xFFFFBA49);
  static const background = Color(0xFFF2F2F2);
  static const backgroundLight = Color(0xFFF9F9F9);
  static const transparent = Color(0x00000000);
  static const success = Color(0xFF2AA952);
  static const green = Color(0xFF2AA952);
  static const themePrimary = Colors.blue;
}

class AppTheme {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: AppColors.themePrimary,
      primaryColorLight: AppColors.white,
      dividerColor: AppColors.darkGray,
      appBarTheme: theme.appBarTheme.copyWith(
        color: AppColors.themePrimary,
        iconTheme: const IconThemeData(color: AppColors.black),
      ),
      bottomAppBarTheme: const BottomAppBarTheme(color: AppColors.lightGray),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: AppColors.red)
          .copyWith(background: AppColors.background)
          .copyWith(error: AppColors.red),
    );
  }
}
