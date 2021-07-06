import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:summaries_app/ui/widgets/app_text.dart';

class AppCard extends StatelessWidget {
  final String text;
  final bool addIcon;
  final double fontsize;

  const AppCard({
    Key? key,
    required this.text,
    required this.fontsize,
    this.addIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.offWhite,
      child: Padding(
        padding: addIcon
            ? const EdgeInsets.symmetric(horizontal: 8)
            : const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Title(
                  color: Colors.amber,
                  child: AppText(
                    text: text,
                    fontsize: fontsize,
                  ),
                ),
                _makeIcon(context, addIcon),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _makeIcon(BuildContext context, bool addIcon) {
    if (addIcon) {
      return Card(
        color: AppColors.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: GestureDetector(
          /*onTap: () {
          Navigator.pushNamed(context, '/');
        },*/
          child: Container(
            padding: const EdgeInsets.all(8),
            child: const Icon(Icons.add),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
