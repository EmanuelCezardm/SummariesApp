import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/ui/widgets/app_app_bar.dart';
import 'package:summaries_app/ui/widgets/app_card.dart';
import 'package:summaries_app/ui/widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bool isAdm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      endDrawer: _buildDrawer(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppAppBar(
      title: "Summaries App",
      size: MediaQuery.of(context).size,
      subjectScreen: true,
    );
  }

  _buildDrawer() {
    return const AppDrawer();
  }

  _buildBody() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      physics: const BouncingScrollPhysics(),
      children: [
        AppCard(
          text: "Português",
          fontSize: 28,
          onPressed: () {},
          addIcon: isAdm,
        ),
        AppCard(
          text: "Biologia",
          fontSize: 28,
          onPressed: () {},
          addIcon: isAdm,
        ),
      ],
    );
  }
}
