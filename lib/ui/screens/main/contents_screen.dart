import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/data/dao/contentsdao.dart';
import 'package:summaries_app/domain/model/contents_model.dart';
import 'package:summaries_app/domain/model/subjects_model.dart';
import 'package:summaries_app/ui/widgets/app_app_bar.dart';
import 'package:summaries_app/ui/widgets/app_card.dart';
import 'package:summaries_app/ui/widgets/app_drawer.dart';

class ContentsScreen extends StatefulWidget {
  final SubjectsModel subject;
  final bool isAdmin;

  const ContentsScreen({
    required this.subject,
    required this.isAdmin,
    Key? key,
  }) : super(key: key);

  @override
  _ContentsScreenState createState() => _ContentsScreenState();
}

class _ContentsScreenState extends State<ContentsScreen> {
  late Future<List<ContentsModel>> contentsList;

  @override
  void initState() {
    super.initState();

    contentsList =
        ContentsDao().listContentsBySubjectsId(widget.subject.idSubject);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(widget.subject.nameSubjects),
      endDrawer: const AppDrawer(),
      body: _buildFutureBody(),
    );
  }

  _buildAppBar(String title) {
    return AppAppBar(
      title: title,
      size: MediaQuery.of(context).size,
    );
  }

  _buildFutureBody() {
    return FutureBuilder<List<ContentsModel>>(
      future: contentsList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildBody(snapshot.data);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  _buildBody(contentsList) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      physics: const BouncingScrollPhysics(),
      itemCount: contentsList.length,
      itemBuilder: (context, index) {
        return AppCard(
          text: contentsList[index].nameContents,
          fontSize: 26,
          onPressed: () {
            Navigator.pushNamed(context, '/summaries');
          },
          onPressedAddIcon: () {},
          idContents: contentsList[index].idContents,
          idSubject: widget.subject.idSubject,
          isAdmin: widget.isAdmin,
        );
      },
    );
  }
}
