import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/domain/model/subjects_model.dart';
import 'package:summaries_app/ui/widgets/app_app_bar.dart';
import 'package:summaries_app/ui/widgets/app_card.dart';
import 'package:summaries_app/ui/widgets/app_drawer.dart';

class ContentsScreen extends StatefulWidget {
  final SubjectsModel subject;
  final bool isAdm;

  const ContentsScreen({
    required this.subject,
    required this.isAdm,
    Key? key,
  }) : super(key: key);

  @override
  _ContentsScreenState createState() => _ContentsScreenState();
}

class _ContentsScreenState extends State<ContentsScreen> {
  @override
  Widget build(BuildContext context) {
    //final dynamic subject = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: _buildAppBar(widget.subject.nameSubjects),
      endDrawer: const AppDrawer(),
      body: _buildBody(),
    );
  }

  _buildAppBar(String title) {
    return AppAppBar(
      title: title,
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
