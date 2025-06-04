import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  TextTitle({
    super.key,
    this.maxLines = 1,
    this.overflow,
    required this.title,
    this.color = Colors.black,
    this.fontSize = 17.5,
  });

  String title;
  double fontSize;
  TextOverflow? overflow;
  int maxLines;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: overflow,
      maxLines: maxLines,
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
    ;
  }
}
