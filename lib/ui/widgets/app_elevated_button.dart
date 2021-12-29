import 'package:flutter/material.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final String text;
  final double fontSize;

  const AppElevatedButton({
    this.color = AppColors.blue,
    required this.onPressed,
    this.text = '',
    this.fontSize = 30,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        primary: color,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 48,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
