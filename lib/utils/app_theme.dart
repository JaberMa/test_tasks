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
      );
}
