import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';

class SecondaryButton extends StatefulWidget {
  final String title;
  Color color;
  double fontSize;
  double padding;
  bool long;
  final VoidCallback onPressed;
  SecondaryButton({
    super.key,
    this.long = true,
    required this.onPressed,
    this.fontSize = 15,
    this.padding = 12,
    this.color = MyColors.primary,
    required this.title,
  });

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: widget.color,
          padding: EdgeInsets.symmetric(
              vertical: widget.padding, horizontal: (!widget.long) ? 45 : 2),
          minimumSize: Size((widget.long) ? double.infinity : 45, 45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(75),
          ),
          side: BorderSide(color: widget.color, width: 2)),
      child: Text(
        widget.title,
        style:
            TextStyle(fontSize: widget.fontSize, fontWeight: FontWeight.w800),
      ),
    );
  }
}
