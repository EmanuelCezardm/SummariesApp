import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'package:summaries_app/ui/widgets/app_text.dart';

class AppCard extends StatelessWidget {
  final String text;
  final bool addIcon;
  final double fontSize;
  final VoidCallback onPressed;

  const AppCard({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.onPressed,
    this.addIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Card(
      color: AppColors.offWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: addIcon
                ? const EdgeInsets.symmetric(horizontal: 8)
                : const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: SizedBox(
              height: size.width * .1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Title(
                    color: Colors.amber,
                    child: AppText(
                      text: text,
                      fontSize: fontSize,
                    ),
                  ),
                  _makeIcon(context, addIcon),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _makeIcon(context, addIcon) {
    if (addIcon) {
      return Card(
        color: AppColors.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/',
              arguments: <String, String>{
                'name': text,
              },
            );
          },
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
