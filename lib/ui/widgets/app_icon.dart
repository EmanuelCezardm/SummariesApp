import 'package:flutter/cupertino.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final VoidCallback onTap;

  const AppIcon({
    Key? key,
    required this.icon,
    this.size = 28,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: size,
      ),
    );
  }
}
