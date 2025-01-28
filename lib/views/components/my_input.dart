import 'package:flutter/material.dart';

class MyInput extends StatefulWidget {
  final String hint;
  final TextEditingController ctrl;
  final TextInputType keyboardType;
  final double size;
  const MyInput({super.key, required this.size, required this.hint, required this.ctrl, required this.keyboardType});

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      style: TextStyle(
        color:Colors.black54,
        fontSize: widget.size,
        fontWeight: FontWeight.w400
      ),
      decoration: InputDecoration(
        hintText: widget.hint,
        filled: true,
        fillColor: Colors.white30,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(75), borderSide: BorderSide(width: 0.0, color: Colors.white30)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(75), borderSide: BorderSide(width: 0.0, color: Colors.white30)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(75), borderSide: BorderSide(width: 0.0, color: Colors.white30)),
      ),
    );
  }
}
