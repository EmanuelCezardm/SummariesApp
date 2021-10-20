import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:summaries_app/ui/widgets/app_text.dart';

class AppCard extends StatefulWidget {
  final String text;
  final bool starIcon;
  final bool addIcon;
  final double fontSize;
  final VoidCallback onPressed;
  final VoidCallback onPressedAddIcon;
  final bool isAdmin;
  final int idSubject;
  final int idContents;

  const AppCard({
    required this.text,
    required this.fontSize,
    required this.onPressed,
    this.starIcon = true,
    this.addIcon = false,
    required this.onPressedAddIcon,
    this.isAdmin = false,
    required this.idContents,
    required this.idSubject,
    Key? key,
  }) : super(key: key);

  @override
  _AppCardState createState() => _AppCardState();
}

bool favorite = false;

class _AppCardState extends State<AppCard> {
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
    if (widget.isAdmin) {
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
              AppText(
                text: 'id assunto: ${widget.idContents}',
                fontSize: 12,
              ),
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

  _makeIcons() {
    if (widget.starIcon && widget.addIcon == false) {
      return _makeStarIcon();
    } else if (widget.starIcon == false && widget.addIcon) {
      return _makeAddIcon();
    } else {
      return Container();
    }
  }

  _makeStarIcon() {
    if (widget.starIcon) {
      return GestureDetector(
        onTap: () =>
            setState(() => favorite ? favorite = false : favorite = true),
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
    } else {
      return Container();
    }
  }

  _makeAddIcon() {
    if (widget.addIcon) {
      return GestureDetector(
        onTap: widget.onPressedAddIcon,
        child: const Icon(
          Icons.add,
          color: AppColors.blue,
          size: 28,
        ),
      );
    } else {
      return Container();
    }
  }
}
