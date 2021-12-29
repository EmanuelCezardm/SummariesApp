import 'package:flutter/cupertino.dart';
import 'package:summaries_app/ui/styles/app_colors.dart';
import 'app_text.dart';

class AppCupertinoButton extends StatelessWidget {
  final String text;
  final String fontFamily;
  final double fontsize;
  final Color color;
  final TextAlign align;
  final VoidCallback? onPressed;

  const AppCupertinoButton({
    required this.text,
    this.fontFamily = 'Raleway',
    this.fontsize = 20,
    this.color = AppColors.blue,
    this.align = TextAlign.center,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: AppText(
        fontSize: fontsize,
        fontFamily: fontFamily,
        text: text,
        color: color,
        align: align,
      ),
      onPressed: onPressed ??
          () {
            Navigator.pop(context);
          },
    );
  }
}
