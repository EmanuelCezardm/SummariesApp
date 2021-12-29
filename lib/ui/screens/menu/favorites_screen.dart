import 'package:flutter/material.dart';
import 'package:summaries_app/data/dao/contentsdao.dart';
import 'package:summaries_app/data/dao/favoritedao.dart';
import 'package:summaries_app/domain/model/contents_model.dart';
import 'package:summaries_app/domain/model/favorite_model.dart';
import 'package:summaries_app/domain/model/user_model.dart';
import 'package:summaries_app/ui/widgets/app_app_bar.dart';
import 'package:summaries_app/ui/widgets/app_card.dart';

class FavoritesScreen extends StatefulWidget {
  final UserModel user;

  const FavoritesScreen({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late Future<List<ContentsModel>> contentsList;
  late Future<List<FavoriteModel>> favoriteList;

  UserModel get user => widget.user;

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
    return contentsList = ContentsDao().listContents();
  }

  Future<List<FavoriteModel>> _fetchFavoritesList() {
    return favoriteList = FavoriteDao().listFavoritesByEmailUser(user.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildFutureBody(),
    );
  }

  _buildAppBar() {
    return AppAppBar(
      title: "Favoritos",
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

  _verificationFunction(favorite, contents) {
    for (var i = 0; i < contents.length; i++) {
      if (favorite.idSubject == contents[i].idSubject &&
          favorite.idContents == contents[i].idContents) {
        return contents[i].nameContents;
      }
    }
    return 'Não encontrado';
  }

  _buildBody(contents, favorites) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      physics: const BouncingScrollPhysics(),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return AppCard(
          favorite:
              _favoriteVerification(favorites[index].idContents, contents),
          user: user,
          idContents: favorites[index].idContents,
          idSubject: favorites[index].idSubject,
          text: _verificationFunction(favorites[index], contents),
          fontSize: 32,
          onPressed: () {},
        );
      },
    );
  }

  bool _favoriteVerification(favorite, contents) {
    for (var j = 0; j < contents.length; j++) {
      if (favorite == contents[j].idContents) {
        return true;
      }
    }
    return false;
  }
}
