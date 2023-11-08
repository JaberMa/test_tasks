import 'package:flutter/material.dart';
import 'constants/app_colors.dart';

class AppTheme {
  /// A light theme for App
  static ThemeData get darkTheme => ThemeData(
        scaffoldBackgroundColor: AppColors.darkColor,
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.darkColor),
        textTheme: ThemeData.dark().textTheme,
        iconTheme: const IconThemeData(color: AppColors.borderColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColors.darkColor,
            backgroundColor: Colors.white,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17.0),
              borderSide: const BorderSide(color: Colors.grey)),
          labelStyle: const TextStyle(color: AppColors.greyedTextColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
        ),
      );
}
