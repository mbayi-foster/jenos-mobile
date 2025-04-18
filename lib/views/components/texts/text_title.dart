import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextTitle extends StatefulWidget {
  String title;
  double fontSize;
  TextOverflow? overflow;
  int maxLines;
  Color color;
  TextTitle(
      {super.key,
      this.color = Colors.black,
      this.maxLines = 1,
      this.overflow,
      required this.title,
      this.fontSize = 17.5});

  @override
  State<TextTitle> createState() => _TextTitleState();
}

class _TextTitleState extends State<TextTitle> {
  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: widget.overflow,
      maxLines: widget.maxLines,
      widget.title,
      style: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: FontWeight.w500,
          color: widget.color),
    );
  }
}
