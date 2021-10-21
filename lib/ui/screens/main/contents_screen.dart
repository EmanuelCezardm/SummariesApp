import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/data/dao/contentsdao.dart';
import 'package:summaries_app/data/dao/favoritedao.dart';
import 'package:summaries_app/domain/model/contents_model.dart';
import 'package:summaries_app/domain/model/favorite_model.dart';
import 'package:summaries_app/domain/model/subjects_model.dart';
import 'package:summaries_app/domain/model/user_model.dart';
import 'package:summaries_app/ui/screens/admin/edit_contents_screen.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:summaries_app/ui/widgets/app_app_bar.dart';
import 'package:summaries_app/ui/widgets/app_card.dart';
import 'package:summaries_app/ui/widgets/app_drawer.dart';
import 'package:summaries_app/ui/widgets/app_text.dart';

class ContentsScreen extends StatefulWidget {
  final SubjectsModel subject;
  final UserModel user;

  const ContentsScreen({
    required this.subject,
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  _ContentsScreenState createState() => _ContentsScreenState();
}

class _ContentsScreenState extends State<ContentsScreen> {
  late Future<List<ContentsModel>> contentsList;
  late Future<List<FavoriteModel>> favoriteList;

  UserModel get user => widget.user;
  SubjectsModel get subject => widget.subject;

  @override
  void initState() {
    super.initState();

    _fetchDB();
  }

  _fetchDB() {
    _fetchContentsList();
    _fetchFavoritesList();
  }

  Future<List<ContentsModel>> _fetchContentsList() {
    return contentsList =
        ContentsDao().listContentsBySubjectsId(subject.idSubject);
  }

  Future<List<FavoriteModel>> _fetchFavoritesList() {
    return favoriteList = FavoriteDao().listFavoritesByEmailUserIdSubject(
        widget.user.email, subject.idSubject);
  }

  @override
  Widget build(BuildContext context) {
    _fetchDB();
    return Scaffold(
      appBar: _buildAppBar(subject.nameSubjects),
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
          return _buildFutureFutureBody(snapshot.data);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  _buildFutureFutureBody(contentsList) {
    return FutureBuilder<List<FavoriteModel>>(
      future: favoriteList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildBody(contentsList, snapshot.data);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  bool _favoriteVerification(idContents, favorites) {
    for (var j = 0; j < favorites.length; j++) {
      if (idContents == favorites[j].idContents) {
        return true;
      }
    }
    return false;
  }

  _buildBody(contentsList, favoritesList) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      physics: const BouncingScrollPhysics(),
      itemCount: contentsList.length,
      itemBuilder: (context, index) {
        return AppCard(
          favorite: _favoriteVerification(
              contentsList[index].idContents, favoritesList),
          text: contentsList[index].nameContents,
          fontSize: 26,
          onPressed: () {
            Navigator.pushNamed(context, '/summaries');
          },
          idContents: contentsList[index].idContents,
          idSubject: subject.idSubject,
          user: widget.user,
          onPressedEditIcon: () {
            Navigator.of(context)
                .push(
                  MaterialPageRoute(
                    builder: (context) => EditContentsScreen(
                      subject: subject,
                      content: contentsList[index],
                    ),
                  ),
                )
                .whenComplete(() => setState(() {
                      _fetchDB();
                    }));
          },
          onPressedDeleteIcon: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  actionsAlignment: MainAxisAlignment.center,
                  backgroundColor: AppColors.background,
                  title: AppText(
                    fontSize: 20,
                    text: 'Excluir: ${contentsList[index].nameContents}?',
                    align: TextAlign.center,
                    fontFamily: 'Raleway',
                  ),
                  actions: [
                    CupertinoButton(
                      child: const AppText(
                        fontSize: 20,
                        fontFamily: 'Raleway',
                        text: 'CANCELAR',
                        color: AppColors.blue,
                        align: TextAlign.center,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoButton(
                      child: const AppText(
                        fontSize: 20,
                        fontFamily: 'Raleway',
                        text: 'EXCLUIR',
                        color: AppColors.blue,
                        align: TextAlign.center,
                      ),
                      onPressed: () {
                        ContentsDao().deleteContent(
                            contentsList[index].idContents, subject.idSubject);
                        Navigator.pop(context);
                        setState(() {
                          _fetchDB();
                        });
                      },
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
