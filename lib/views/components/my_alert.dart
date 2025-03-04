import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyAlert {
  /*  Color bg;
  Color textColor;
  String text;

  MyAlert(
      {this.bg = Colors.red,
      this.textColor = Colors.white,
      required this.text}); */

  static void show(
      {Color bg = Colors.red,
      Color textColor = Colors.white,
      required String text, int time = 2}) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: time,
        backgroundColor: bg,
        textColor: textColor,
        fontSize: 15.0);
  }
}
