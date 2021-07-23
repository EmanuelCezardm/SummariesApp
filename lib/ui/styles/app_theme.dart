import 'package:flutter/material.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.darkBlue,
      textTheme: const TextTheme(
        bodyText2: TextStyle(
          fontSize: 18,
          color: AppColors.darkBlue,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white70,
      ),
    );
  }
}
