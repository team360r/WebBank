import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
          primary: AppColors.primary,
          surface: AppColors.surface,
          error: AppColors.error,
        ),
        textTheme: _buildTextTheme(Brightness.light),
        scaffoldBackgroundColor: AppColors.surface,
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.dark,
          primary: AppColors.primaryLight,
          error: AppColors.error,
        ),
        textTheme: _buildTextTheme(Brightness.dark),
      );

  static TextTheme _buildTextTheme(Brightness brightness) {
    final Color defaultColor =
        brightness == Brightness.light ? AppColors.textPrimary : Colors.white;

    return TextTheme(
      displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.w400, color: defaultColor),
      displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w400, color: defaultColor),
      displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, color: defaultColor),
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: defaultColor),
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: defaultColor),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: defaultColor),
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: defaultColor),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: defaultColor),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: defaultColor),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: defaultColor),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: defaultColor),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: brightness == Brightness.light ? AppColors.textSecondary : Colors.white70,
      ),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: defaultColor),
      labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: defaultColor),
      labelSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: defaultColor),
    );
  }
}
