import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';

class SecondaryButton extends StatefulWidget {
  final String title;
  Color color;
  double fontSize;
  double padding;
  final VoidCallback onPressed;
  SecondaryButton({
    super.key,
    required this.onPressed,
    required this.fontSize,
    required this.padding,
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
      child: Text(
        widget.title,
        style:
            TextStyle(fontSize: widget.fontSize, fontWeight: FontWeight.w800),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: widget.color,
          minimumSize: Size(double.infinity, 45),
          /* padding:
              EdgeInsets.symmetric(vertical: 12, horizontal: widget.padding), */
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(75),
          ),
          side: BorderSide(color: widget.color, width: 2)),
    );
  }
}
