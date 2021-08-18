import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/ui/widgets/app_app_bar.dart';
import 'package:summaries_app/ui/widgets/app_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppAppBar(
      title: "Favoritos",
      size: MediaQuery.of(context).size,
    );
  }

  _buildBody() {
    return ListView(
      padding: const EdgeInsets.all(8),
      physics: const BouncingScrollPhysics(),
      children: [
        AppCard(
          text: "Conteúdo favoritado",
          fontSize: 28,
          onPressed: () {},
          addIcon: false,
        ),
      ],
    );
  }
}
