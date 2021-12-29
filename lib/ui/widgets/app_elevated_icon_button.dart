import 'package:flutter/material.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';

class AppElevatedIconButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final IconData icon;
  final double iconSize;
  final String text;
  final double fontSize;

  const AppElevatedIconButton({
    this.color = AppColors.blue,
    required this.onPressed,
    required this.icon,
    this.iconSize = 32,
    this.text = '',
    this.fontSize = 30,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
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
      icon: Icon(
        icon,
        size: iconSize,
      ),
      label: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
