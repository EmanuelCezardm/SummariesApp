import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/data/dao/subjectsdao.dart';
import 'package:summaries_app/domain/model/subjects_model.dart';
import 'package:summaries_app/domain/model/user_model.dart';
import 'package:summaries_app/ui/screens/admin/add_contents_screen.dart';
import 'package:summaries_app/ui/screens/main/contents_screen.dart';
import 'package:summaries_app/ui/widgets/app_app_bar.dart';
import 'package:summaries_app/ui/widgets/app_card.dart';
import 'package:summaries_app/ui/widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  final UserModel user;

  const HomeScreen({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<SubjectsModel>> subjectsList;

  UserModel get user => widget.user;

  @override
  void initState() {
    super.initState();

    _fetchDB();
  }

  _fetchDB() {
    subjectsList = SubjectsDao().listSubjects();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: _buildAppBar(),
        drawer: AppDrawer(user: user),
        body: _buildFutureBody(),
      ),
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
          user: user,
          subjectScreen: true,
          idContents: 0,
          idSubject: subjectList[index].idSubject,
          text: subjectList[index].nameSubjects,
          fontSize: 32,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContentsScreen(
                  subject: subjectList[index],
                  user: user,
                ),
              ),
            );
          },
          onPressedAddIcon: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddContentsScreen(
                  subject: subjectList[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
