import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final String fontFamily;
  final Color? color;

  const AppText({
    Key? key,
    this.text = '',
    this.fontSize = 16,
    this.fontFamily = 'Raleway',
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        color: color,
      ),
    );
  }
}
