import 'package:flutter/material.dart';
import 'package:jenos_app/utils/colors.dart';

class PrimaryButton extends StatefulWidget {
  final String title;
  final bool long;
  final Color bg;
  final double fontSize;
  final double padding;
  final VoidCallback? onPressed;
  final bool status;

  const PrimaryButton({
    super.key,
    this.long = true,
    required this.onPressed,
    this.fontSize = 15,
    this.padding = 12.00,
    this.bg = MyColors.primary,
    required this.title,
    this.status = true
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (widget.status) ? widget.onPressed : null,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
            vertical: widget.padding, horizontal: (!widget.long) ? 45 : 2),
        minimumSize: Size((widget.long) ? double.infinity : 45, 45),
        backgroundColor: widget.bg,
        foregroundColor: Colors.white,
        //padding: EdgeInsets.symmetric(vertical: 12, horizontal: widget.padding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(75),
        ),
      ),
      child: Text(
        widget.title,
        style:
            TextStyle(fontSize: widget.fontSize, fontWeight: FontWeight.w800),
      ),
    );
  }
}
