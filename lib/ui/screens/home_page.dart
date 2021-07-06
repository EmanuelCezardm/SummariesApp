import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:summaries_app/ui/widgets/app_card.dart';
import 'package:summaries_app/ui/widgets/app_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final bool isAdmin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AppText(
              text: "Summaries App",
              fontsize: 32,
            ),
            _makeNotiButton(),
          ],
        ),
        elevation: 0,
      ),
      drawer: Drawer(
        child: Container(
          color: AppColors.background,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          children: [
            GestureDetector(
              child: const AppCard(
                text: "Português",
                fontsize: 28,
              ),
            ),
            GestureDetector(
              child: const AppCard(
                text: "Biologia",
                fontsize: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _makeNotiButton() {
    if (isAdmin) {
      return IconButton(
        onPressed: () {
          debugPrint("noti button");
        },
        splashRadius: 16,
        icon: const Icon(
          Icons.notifications,
        ),
      );
    } else {
      return Container();
    }
  }
}
