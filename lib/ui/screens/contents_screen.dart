import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/ui/widgets/app_app_bar.dart';
import 'package:summaries_app/ui/widgets/app_card.dart';
import 'package:summaries_app/ui/widgets/app_drawer.dart';

class ContentsScreen extends StatefulWidget {
  const ContentsScreen({Key? key}) : super(key: key);

  @override
  _ContentsScreenState createState() => _ContentsScreenState();
}

class _ContentsScreenState extends State<ContentsScreen> {
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
      title: "Biologia",
      size: MediaQuery.of(context).size,
      subjectScreen: false,
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
          text: "Ecologia",
          fontSize: 28,
          onPressed: () {},
          addIcon: isAdm,
        ),
        AppCard(
          text: "Citologia",
          fontSize: 28,
          onPressed: () {},
          addIcon: isAdm,
        ),
         AppCard(
          text: "Fisiologia Humana",
          fontSize: 28,
          onPressed: () {},
          addIcon: isAdm,
        ),
         AppCard(
          text: "Genética",
          fontSize: 28,
          onPressed: () {},
          addIcon: isAdm,
        ),
         AppCard(
          text: "Bioquímica",
          fontSize: 28,
          onPressed: () {},
          addIcon: isAdm,
        ),
      ],
    );
  }
}