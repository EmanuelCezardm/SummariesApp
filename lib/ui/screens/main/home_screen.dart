import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/data/dao/subjectsdao.dart';
import 'package:summaries_app/domain/model/subjects_model.dart';
import 'package:summaries_app/ui/screens/main/contents_screen.dart';
import 'package:summaries_app/ui/widgets/app_app_bar.dart';
import 'package:summaries_app/ui/widgets/app_card.dart';
import 'package:summaries_app/ui/widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<SubjectsModel>> subjectsList;

  @override
  void initState() {
    super.initState();

    subjectsList = SubjectsDao().listSubjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      endDrawer: const AppDrawer(),
      body: _buildFutureBody(),
    );
  }

  _buildAppBar() {
    return AppAppBar(
      title: "Summaries App",
      size: MediaQuery.of(context).size,
      subjectScreen: true,
    );
  }

  _buildFutureBody() {
    return FutureBuilder<List<SubjectsModel>>(
      future: subjectsList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildBody(snapshot.data);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  _buildBody(subjectList) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      physics: const BouncingScrollPhysics(),
      itemCount: subjectList.length,
      itemBuilder: (context, index) {
        return AppCard(
          text: subjectList[index].nameSubjects,
          fontSize: 32,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContentsScreen(
                  subject: subjectList[index],
                  isAdm: false,
                ),
              ),
            );
          },
          addIcon: false,
        );
      },
    );
  }
}
