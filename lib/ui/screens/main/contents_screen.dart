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
      endDrawer: const AppDrawer(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppAppBar(
      title: "Biologia",
      size: MediaQuery.of(context).size,
    );
  }

  _buildBody() {
    return ListView(
      padding: const EdgeInsets.all(8),
      physics: const BouncingScrollPhysics(),
      children: [
        AppCard(
          text: "Ecologia",
          fontSize: 28,
          onPressed: () {
            Navigator.pushNamed(context, '/summaries');
          },
        ),
        AppCard(
          text: "Citologia",
          fontSize: 28,
          onPressed: () {
            Navigator.pushNamed(context, '/summaries');
          },
        ),
        AppCard(
          text: "Fisiologia Humana",
          fontSize: 28,
          onPressed: () {
            Navigator.pushNamed(context, '/summaries');
          },
        ),
        AppCard(
          text: "Genética",
          fontSize: 28,
          onPressed: () {
            Navigator.pushNamed(context, '/summaries');
          },
        ),
        AppCard(
          text: "Bioquímica",
          fontSize: 28,
          onPressed: () {
            Navigator.pushNamed(context, '/summaries');
          },
        ),
      ],
    );
  }
}
