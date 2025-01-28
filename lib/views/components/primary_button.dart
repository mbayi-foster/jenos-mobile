import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';

class PrimaryButton extends StatefulWidget {
  final String title;
  final Color bg;
  final double fontSize;
  final double padding;
  final VoidCallback onPressed;
  
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.fontSize,
    required this.padding,
    this.bg = MyColors.primary,
    required this.title,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
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
        backgroundColor: widget.bg,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: widget.padding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(75),
        ),
      ),
    );
  }
}
