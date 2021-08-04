import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Size size;
  final bool subjectScreen;

  const AppAppBar({
    Key? key,
    required this.title,
    required this.size,
    this.subjectScreen = false,
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
        title: AppText(
          text: title,
          fontSize: 32,
        ),
        elevation: 0,
      );
    } else {
      return AppBar(
        title: AppText(
          text: title,
          fontSize: 32,
        ),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      );
    }
  }
}
