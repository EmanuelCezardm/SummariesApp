import 'package:flutter/material.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';

import 'app_text.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Size size;
  final bool subjectScreen;
  final double fontSize;
  final Color color;
  final VoidCallback? onTapBack;
  final Color? iconColor;

  const AppAppBar({
    Key? key,
    required this.title,
    required this.size,
    this.subjectScreen = false,
    this.fontSize = 32,
    this.color = AppColors.blue,
    this.onTapBack,
    this.iconColor,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(size.width * .15);

  @override
  Widget build(BuildContext context) {
    return _buildAppBar(subjectScreen, context);
  }

  _buildAppBar(subjectScreen, context) {
    if (subjectScreen) {
      return AppBar(
        backgroundColor: color,
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: AppText(
            text: title,
            fontSize: fontSize,
          ),
        ),
        elevation: 0,
      );
    } else {
      return AppBar(
        backgroundColor: color,
        title: _buildtitle(),
        elevation: 0,
        leading: GestureDetector(
          onTap: onTapBack ??
              () {
                Navigator.pop(context);
              },
          child: Icon(
            Icons.arrow_back_ios,
            color: iconColor ?? AppColors.white,
          ),
        ),
      );
    }
  }

  _buildtitle() {
    if (title != "") {
      return FittedBox(
        fit: BoxFit.scaleDown,
        child: AppText(
          text: title,
          fontSize: fontSize,
        ),
      );
    }
    return Container();
  }
}
