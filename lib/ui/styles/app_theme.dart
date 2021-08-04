import 'package:flutter/material.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Raleway',
      appBarTheme: const AppBarTheme(
        color: AppColors.blue,
      ),
      textTheme: const TextTheme(
        bodyText2: TextStyle(
          fontSize: 18,
          color: AppColors.blue,
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.white,
      ),
    );
  }
}
