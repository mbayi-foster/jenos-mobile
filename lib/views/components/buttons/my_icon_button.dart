import 'package:flutter/material.dart';

class MyIconButton extends StatefulWidget {
  final String title;
  final Color bg;
  final double fontSize;
  final double padding;
  final VoidCallback onPressed;
  final IconData icon;

  const MyIconButton({
    super.key,
    required this.title,
    required this.bg,
    this.fontSize = 22.5,
    this.padding = 16.00,
    required this.onPressed,
    required this.icon,
  });

  @override
  State<MyIconButton> createState() => _MyIconButtonState();
}

class _MyIconButtonState extends State<MyIconButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: widget.onPressed,
      /*    child: Text(
        widget.title,
        style:
        TextStyle(fontSize: widget.fontSize, fontWeight: FontWeight.w800),
      )*/
      icon: Icon(
        widget.icon,
        color: Colors.white,
      ),
      label: Text(
        widget.title,
        style:
            TextStyle(fontSize: widget.fontSize, fontWeight: FontWeight.w800),
      ),
      style: ElevatedButton.styleFrom(
         padding: EdgeInsets.symmetric(
            vertical: widget.padding,),
        backgroundColor: widget.bg,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 45),
        // padding: EdgeInsets.symmetric(vertical: 12, horizontal: widget.padding),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(75),
        ),
      ),
    );
  }
}
