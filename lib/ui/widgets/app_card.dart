import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:summaries_app/ui/widgets/app_text.dart';

class AppCard extends StatefulWidget {
  final String text;
  final bool addIcon;
  final double fontSize;
  final VoidCallback onPressed;

  const AppCard({
    required this.text,
    required this.fontSize,
    required this.onPressed,
    this.addIcon = true,
    Key? key,
  }) : super(key: key);

  @override
  _AppCardState createState() => _AppCardState();
}

bool favorite = false;

class _AppCardState extends State<AppCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: widget.onPressed,
      child: Card(
        color: AppColors.offWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: SizedBox(
            height: size.width * .1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Title(
                  color: Colors.amber,
                  child: AppText(
                    text: widget.text,
                    fontSize: widget.fontSize,
                  ),
                ),
                _makeIcon(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _makeIcon(context) {
    if (widget.addIcon) {
      return GestureDetector(
        onTap: () =>
            setState(() => favorite ? favorite = false : favorite = true),
        child: Container(
          padding: const EdgeInsets.all(8),
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
        ),
      );
    } else {
      return Container();
    }
  }
}
