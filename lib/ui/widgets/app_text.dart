import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final String fontFamily;
  final Color? color;
  final TextAlign align;
  final bool bold;

  const AppText({
    Key? key,
    this.text = '',
    this.fontSize = 16,
    this.fontFamily = 'Raleway',
    this.color,
    this.align = TextAlign.justify,
    this.bold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        color: color,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
