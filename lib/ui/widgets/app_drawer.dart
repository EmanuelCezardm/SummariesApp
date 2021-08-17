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
            Container(
              child: _buildListTile(
                icon: Icons.account_circle_outlined,
                text: 'Perfil',
                onTap: () {
                  Navigator.popAndPushNamed(context, '/profile');
                },
              ),
            ),
            Container(
              child: _buildListTile(
                icon: Icons.star_border_outlined,
                text: 'Favoritos',
                onTap: () {},
              ),
            ),
            Container(
              child: _buildListTile(
                icon: Icons.supervisor_account_rounded,
                text: 'Fale Conosco',
                onTap: () {
                  _functionFaleConosco(context);
                },
              ),
            ),
            Container(
              child: _buildListTile(
                icon: Icons.info_outlined,
                text: 'Sobre',
                onTap: () {},
              ),
            ),
            Container(
              child: _buildListTile(
                icon: Icons.logout_outlined,
                text: 'Sair',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildListTile({icon, text, onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: AppColors.blue,
      ),
      title: AppText(
        text: text,
        fontSize: 24,
        fontFamily: 'Otomanopee One',
        color: AppColors.blue,
      ),
      onTap: onTap,
    );
  }

  _functionFaleConosco(context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          backgroundColor: AppColors.background,
          title: const AppText(
            fontSize: 20,
            text: 'SummariesApp@gmail.com',
            align: TextAlign.center,
            fontFamily: 'Raleway',
          ),
          actions: [
            CupertinoButton(
              child: const AppText(
                fontSize: 20,
                fontFamily: 'Raleway',
                text: 'Fechar',
                color: AppColors.blue,
                align: TextAlign.center,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
