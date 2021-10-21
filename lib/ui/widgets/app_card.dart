import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/data/dao/favoritedao.dart';
import 'package:summaries_app/domain/model/favorite_model.dart';
import 'package:summaries_app/domain/model/user_model.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:summaries_app/ui/widgets/app_text.dart';

class AppCard extends StatefulWidget {
  final String text;
  final bool subjectScreen;
  final double fontSize;
  final VoidCallback onPressed;
  final VoidCallback? onPressedAddIcon;
  final VoidCallback? onPressedDeleteIcon;
  final VoidCallback? onPressedEditIcon;
  final UserModel user;
  final int idSubject;
  final int idContents;
  late bool favorite;

  AppCard({
    required this.text,
    this.fontSize = 30,
    required this.onPressed,
    required this.user,
    required this.idContents,
    required this.idSubject,
    this.onPressedAddIcon,
    this.onPressedDeleteIcon,
    this.onPressedEditIcon,
    this.subjectScreen = false,
    this.favorite = false,
    Key? key,
  }) : super(key: key);

  @override
  _AppCardState createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool get favorite => widget.favorite;
  setFavorite(favorite) => widget.favorite = favorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Card(
        color: AppColors.offWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildText(),
              _makeIcons(),
            ],
          ),
        ),
      ),
    );
  }

  _buildText() {
    if (widget.user.isAdmin) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: widget.text,
            fontSize: widget.fontSize,
          ),
          Row(
            children: [
              AppText(
                text: 'id matéria: ${widget.idSubject}',
                fontSize: 12,
              ),
              const SizedBox(width: 8),
              _buildIdContentIndicator(),
            ],
          ),
        ],
      );
    } else {
      return AppText(
        text: widget.text,
        fontSize: widget.fontSize,
      );
    }
  }

  _buildIdContentIndicator() {
    if (widget.subjectScreen) {
      return Container();
    }
    return AppText(
      text: 'id assunto: ${widget.idContents}',
      fontSize: 12,
    );
  }

  _makeIcons() {
    if (widget.subjectScreen == false && widget.user.isAdmin == false) {
      return _makeStarIcon();
    } else if (widget.subjectScreen && widget.user.isAdmin) {
      return _makeAddIcon();
    } else if (widget.subjectScreen == false && widget.user.isAdmin) {
      return _makeDeleteEditIcon();
    } else {
      return Container();
    }
  }

  _makeStarIcon() {
    return GestureDetector(
      onTap: () => setState(() => _functionSetFavorite()),
      child: favorite
          ? const Icon(
              Icons.star,
              color: Colors.orangeAccent,
              size: 28,
            )
          : const Icon(
              Icons.star_border_outlined,
              color: AppColors.blue,
              size: 28,
            ),
    );
  }

  _functionSetFavorite() {
    if (favorite) {
      FavoriteDao().deleteFavorite(
          widget.user.email, widget.idSubject, widget.idContents);
      setFavorite(false);
    } else {
      final favoriteModel =
          FavoriteModel(widget.user.email, widget.idSubject, widget.idContents);
      FavoriteDao().addFavorite(favoriteModel);
      setFavorite(true);
    }
  }

  _makeAddIcon() {
    return GestureDetector(
      onTap: widget.onPressedAddIcon,
      child: const Icon(
        Icons.add,
        color: AppColors.blue,
        size: 28,
      ),
    );
  }

  _makeDeleteEditIcon() {
    return Row(
      children: [
        GestureDetector(
          onTap: widget.onPressedDeleteIcon,
          child: const Icon(
            Icons.delete_outline,
            color: AppColors.blue,
            size: 24,
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: widget.onPressedEditIcon,
          child: const Icon(
            Icons.edit_outlined,
            color: AppColors.blue,
            size: 24,
          ),
        ),
      ],
    );
  }
}
