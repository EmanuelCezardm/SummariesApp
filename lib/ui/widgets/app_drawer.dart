import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:summaries_app/ui/widgets/app_text.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.background,
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(
                Icons.account_circle_outlined,
                size: 28,
                color: AppColors.blue,
              ),
              title: const AppText(
                text: 'Perfil',
                fontSize: 24,
                fontFamily: 'Otomanopee One',
                color: AppColors.blue,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.star_border_outlined,
                size: 28,
                color: AppColors.blue,
              ),
              title: const AppText(
                text: 'Favoritos',
                fontSize: 24,
                fontFamily: 'Otomanopee One',
                color: AppColors.blue,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.supervisor_account_rounded,
                size: 28,
                color: AppColors.blue,
              ),
              title: const AppText(
                text: 'Fale Conosco',
                fontSize: 24,
                fontFamily: 'Otomanopee One',
                color: AppColors.blue,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.info_outline,
                size: 28,
                color: AppColors.blue,
              ),
              title: const AppText(
                text: 'Sobre',
                fontSize: 24,
                fontFamily: 'Otomanopee One',
                color: AppColors.blue,
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.logout_outlined,
                size: 28,
                color: AppColors.blue,
              ),
              title: const AppText(
                text: 'Sair',
                fontSize: 24,
                fontFamily: 'Otomanopee One',
                color: AppColors.blue,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
