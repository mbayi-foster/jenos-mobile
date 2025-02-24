import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextTitle extends StatefulWidget {
  String title;
  double fontSize;
  TextTitle({super.key, required this.title, this.fontSize=17.5});

  @override
  State<TextTitle> createState() => _TextTitleState();
}

class _TextTitleState extends State<TextTitle> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      style: TextStyle(
          fontSize:widget.fontSize, fontWeight: FontWeight.w500, color: Colors.black),
    );
  }
}
