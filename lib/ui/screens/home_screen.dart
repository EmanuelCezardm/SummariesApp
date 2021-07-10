import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:summaries_app/ui/widgets/app_card.dart';
import 'package:summaries_app/ui/widgets/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bool isAdmin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppText(
            text: "Summaries App",
            fontsize: 32,
          ),
          _buildNotiButton(() {}),
        ],
      ),
      elevation: 0,
    );
  }

  _buildNotiButton(onPressed) {
    if (isAdmin) {
      return IconButton(
        onPressed: onPressed,
        splashRadius: 16,
        icon: const Icon(
          Icons.notifications,
        ),
      );
    } else {
      return Container();
    }
  }

  _buildDrawer() {
    return Drawer(
      child: Container(
        color: AppColors.background,
      ),
    );
  }

  _buildBody() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      physics: const BouncingScrollPhysics(),
      children: [
        AppCard(
          text: "Português",
          fontsize: 28,
          onPressed: () {},
        ),
        AppCard(
          text: "Biologia",
          fontsize: 28,
          onPressed: () {},
        ),
      ],
    );
  }
}
