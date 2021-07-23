import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:summaries_app/ui/widgets/app_icon.dart';

//
//
//
//----------------Adicionar onTaps dos icones---------------------//
//
//
//

class AppBottomNavigationBar extends StatelessWidget {
  final bool subjectsScreen;
  const AppBottomNavigationBar({
    Key? key,
    this.subjectsScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return _buildBottomNavigator(size);
  }

  _buildBottomNavigator(size) {
    if (subjectsScreen) {
      return Container(
        color: AppColors.darkBlue,
        height: size.width * .12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppIcon(
              size: 32,
              icon: Icons.account_circle,
              onTap: () {},
            ),
            AppIcon(
              size: 32,
              icon: Icons.star_border,
              onTap: () {},
            ),
          ],
        ),
      );
    } else {
      return Container(
        color: AppColors.darkBlue,
        height: size.width * .12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppIcon(
              size: 32,
              icon: Icons.arrow_back_ios,
              onTap: () {},
            ),
            AppIcon(
              size: 32,
              icon: Icons.account_circle,
              onTap: () {},
            ),
            AppIcon(
              size: 32,
              icon: Icons.star_border,
              onTap: () {},
            ),
          ],
        ),
      );
    }
  }
}
