import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontsize;

  const AppText({
    Key? key,
    this.text = '',
    this.fontsize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
      ),
    );
  }
}
