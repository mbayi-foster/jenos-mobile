import 'package:flutter/material.dart';

class TextTitle extends StatefulWidget {
  String title;
  TextTitle({super.key, required this.title});

  @override
  State<TextTitle> createState() => _TextTitleState();
}

class _TextTitleState extends State<TextTitle> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      style: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.black),
    );
  }
}
